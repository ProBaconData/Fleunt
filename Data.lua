local L_1_
local L_2_, L_3_, L_4_, L_5_, L_6_, L_7_, L_8_, L_9_, L_10_, L_11_, L_12_, L_13_, L_14_, L_15_, L_16_, L_17_, L_18_, L_19_, L_20_, L_21_ = {
	function()
		local L_45_, L_46_, L_47_ = L_1_(1)
		return (function(...)
			local function L_48_func(L_65_arg0)
				local L_66_ = typeof(L_65_arg0)
				if L_66_ == 'function' and (clonefunc or clonefunction) then
					return (clonefunc or clonefunction)(L_65_arg0), true
				elseif L_66_ == 'Instance' and (cloneref or clonerefrence) then
					return (cloneref or clonerefrence)(L_65_arg0), true
				elseif L_66_ == 'table' then
					local function L_67_func(L_68_arg0, L_69_arg1)
						L_69_arg1 = L_69_arg1 or {}
						local L_70_, L_71_ = (typeof(L_68_arg0))
						if L_70_ == 'table' then
							if L_69_arg1[L_68_arg0] then
								L_71_ = L_69_arg1[L_68_arg0]
							else
								L_71_ = {}
								L_69_arg1[L_68_arg0] = L_71_
								for L_72_forvar0, L_73_forvar1 in next, L_68_arg0, nil do
									L_71_[L_67_func(L_72_forvar0, L_69_arg1)] = L_67_func(L_73_forvar1, L_69_arg1)
								end
								(setrawmetatable or setmetatable)(L_71_, L_67_func((getrawmetatable or getmetatable)(L_68_arg0), L_69_arg1))
							end
						elseif L_70_ == 'Instance' or L_70_ == 'function' then
							L_71_ = L_48_func(L_68_arg0)
						else
							L_71_ = L_68_arg0
						end
						return L_71_
					end
					return L_67_func(L_65_arg0), true
				else
					return L_65_arg0, false
				end
			end
			local L_49_, L_50_, L_51_, L_52_ = L_48_func(game:GetService'MarketplaceService'), L_48_func(game:GetService'TweenService'), L_48_func(game:GetService'Workspace').CurrentCamera, L_46_
			local L_53_, L_54_, L_55_, L_56_, L_57_, L_58_ = L_52_.Components, L_47_(L_52_.Creator), L_47_(L_52_.Elements), L_47_(L_52_.Acrylic), L_47_(L_52_.Icons), L_47_(L_52_.Themes)
			local L_59_, L_60_, L_61_ = L_47_(L_53_.Notification), shared or _G or (getgenv and getgenv()) or getfenv(), L_54_.New
			local L_62_ = L_61_('ScreenGui', {
				Name = 'Fluent Renewed Base GUI'
			})
			L_62_.Parent = (function()
				local L_74_, L_75_ = pcall(function()
					return (gethui or get_hidden_ui)()
				end)
				if L_74_ and L_75_ then
					return L_75_
				end
				L_74_, L_75_ = pcall(function()
					local L_76_ = game:GetService'CoreGui'
					L_76_:GetFullName()
					return L_76_
				end)
				if L_74_ and L_75_ then
					return L_75_
				end
				L_74_, L_75_ = pcall(function()
					return (game:IsLoaded() or (game.Loaded:Wait() or true)) and game:GetService'Players'.LocalPlayer:WaitForChild'PlayerGui'
				end)
				if L_74_ and L_75_ then
					return L_75_
				end
				L_74_, L_75_ = pcall(function()
					return game:GetService'StarterGui'
				end)
				if L_74_ and L_75_ then
					return L_75_
				end
				return error[[Seriously bad engine. Can't find a place to store the GUI. Robust code can't help this much incompetence.]]
			end)()
			L_60_.FluentRenewed = L_60_.FluentRenewed or {}
			L_59_:Init(L_62_)
			local L_63_ = {
				Version = '1.0.2',
				OpenFrames = {},
				Options = {},
				Themes = L_58_.Names,
				OnUnload = nil,
				PostUnload = nil,
				CreatedWindow = nil,
				WindowFrame = nil,
				Utilities = {
					Themes = L_58_,
					Shared = L_60_
				},
				Connections = L_54_.Signals,
				Unloaded = false,
				Loaded = true,
				Theme = 'Dark',
				DialogOpen = false,
				UseAcrylic = false,
				Acrylic = false,
				Transparency = true,
				MinimizeKey = Enum.KeyCode.LeftControl,
				GUI = L_62_
			}
			function L_63_.SafeCallback(L_77_arg0, L_78_arg1, ...)
				if typeof(L_78_arg1) ~= 'function' then
					return
				end
				local L_79_, L_80_ = task.spawn(pcall, L_78_arg1, ...)
				if not L_79_ then
					local L_81_, L_82_ = L_80_:find':%d+: '
					task.defer(error, debug.traceback(L_80_))
					L_63_:Notify{
						Title = 'Interface',
						Content = 'Callback error',
						SubContent = not L_82_ and L_80_ or L_80_:sub(L_82_ + 1),
						Duration = 5
					}
				end
			end
			function L_63_.Utilities.Truncate(L_83_arg0, L_84_arg1, L_85_arg2, L_86_arg3)
				local L_87_ = 10 ^ (typeof(L_85_arg2) == 'number' and math.max(L_85_arg2, 0) or 0)
				if L_86_arg3 then
					return math.round(L_84_arg1 * L_87_) // 1 / L_87_
				else
					return L_84_arg1 * L_87_ // 1 / L_87_
				end
			end
			function L_63_.Utilities.Round(L_88_arg0, L_89_arg1, L_90_arg2)
				return L_63_.Utilities:Truncate(L_89_arg1, L_90_arg2, true)
			end
			function L_63_.Utilities.GetIcon(L_91_arg0, L_92_arg1)
				return L_92_arg1 ~= 'SetIcon' and L_57_[L_92_arg1] or nil
			end
			function L_63_.Utilities.Prettify(L_93_arg0, L_94_arg1)
				local L_95_ = typeof(L_94_arg1)
				if L_95_ == 'EnumItem' then
					return L_94_arg1.Name:gsub('(%l)(%u)', '%1 %2')
				elseif L_95_ == 'string' then
					return L_94_arg1:gsub('(%l)(%u)', '%1 %2')
				elseif L_95_ == 'number' then
					return L_63_.Utilities:Round(L_94_arg1, 2)
				else
					return L_94_arg1
				end
			end
			function L_63_.Utilities.Clone(L_96_arg0, L_97_arg1)
				return L_48_func(L_97_arg1)
			end
			local L_64_ = {}
			L_64_.__index = L_64_
			L_64_.__namecall = function(L_98_arg0, L_99_arg1, ...)
				return L_64_[L_99_arg1](...)
			end
			for L_100_forvar0, L_101_forvar1 in next, L_55_ do
				L_64_["-984433945"] = function(L_102_arg0, L_103_arg1, L_104_arg2)
					L_101_forvar1.Container = L_102_arg0.Container
					L_101_forvar1.Type = L_102_arg0.Type
					L_101_forvar1.ScrollFrame = L_102_arg0.ScrollFrame
					L_101_forvar1.Library = L_63_
					return L_101_forvar1:New(L_103_arg1, L_104_arg2)
				end
				L_64_["482247882"] = L_64_["-984433945"]
				L_64_[L_101_forvar1.__type] = L_64_["-984433945"]
			end
			L_63_.Elements = L_64_
			function L_63_.Window(L_105_arg0, L_106_arg1)
				if L_63_.CreatedWindow then
					return 'You cannot create more than one window.'
				end
				if not L_106_arg1.Title then
					local L_108_, L_109_ = pcall(L_49_.GetProductInfo, L_49_, game.PlaceId)
					L_106_arg1.Title = L_108_ and L_109_ or 'Fluent Renewed'
				end
				L_106_arg1.MinSize = L_106_arg1.MinSize or Vector2.new(470, 380)
				L_106_arg1.Size = L_106_arg1.Resize ~= true and L_106_arg1.Size or UDim2.fromOffset(L_63_.Utilities:Resize(L_106_arg1.Size.X.Offset, L_106_arg1.Size.Y.Offset))
				L_106_arg1.MinSize = L_106_arg1.Resize ~= true and L_106_arg1.MinSize or Vector2.new(L_63_.Utilities:Resize(L_106_arg1.MinSize.X, L_106_arg1.MinSize.Y))
				L_63_.MinimizeKey = L_106_arg1.MinimizeKey or Enum.KeyCode.LeftControl
				L_63_.UseAcrylic = L_106_arg1.Acrylic or false
				L_63_.Acrylic = L_106_arg1.Acrylic or false
				L_63_.Theme = L_106_arg1.Theme or 'Vynixu'
				if L_106_arg1.Acrylic then
					L_56_.init()
				end
				local L_107_ = L_47_(L_53_.Window){
					Parent = L_62_,
					Size = L_106_arg1.Size,
					MinSize = L_106_arg1.MinSize,
					Title = L_106_arg1.Title,
					SubTitle = L_106_arg1.SubTitle or 'Made with Fluent Renewed',
					TabWidth = L_106_arg1.TabWidth or 160
				}
				L_62_.Name = "819502482"
				L_63_.CreatedWindow = L_107_
				L_63_:SetTheme(L_106_arg1.Theme)
				return L_107_
			end
			function L_63_.AddWindow(L_110_arg0, L_111_arg1)
				return L_63_:Window(L_111_arg1)
			end
			function L_63_.CreateWindow(L_112_arg0, L_113_arg1)
				return L_63_:Window(L_113_arg1)
			end
			function L_63_.SetTheme(L_114_arg0, L_115_arg1)
				if L_63_.CreatedWindow and table.find(L_63_.Themes, L_115_arg1) then
					L_63_.Theme = L_115_arg1
					L_54_.UpdateTheme()
				end
			end
			function L_63_.Destroy(L_116_arg0)
				if L_63_.CreatedWindow then
					L_63_.Unloaded = true
					L_63_.Loaded = false
					if typeof(L_63_.OnUnload) == 'function' then
						L_63_:SafeCallback(L_63_.OnUnload, tick())
					end
					if L_63_.UseAcrylic then
						L_63_.CreatedWindow.AcrylicPaint.Model:Destroy()
					end
					L_54_.Disconnect()
					for L_121_forvar0, L_122_forvar1 in next, L_63_.Connections do
						local L_123_ = typeof(L_122_forvar1)
						if L_123_ == 'RBXScriptConnection' and L_122_forvar1.Connected then
							L_122_forvar1:Disconnect()
						end
					end
					local L_117_, L_118_, L_119_ = TweenInfo.new(0.6666666666666666, Enum.EasingStyle.Quint)
					local L_120_ = function(L_124_arg0, L_125_arg1)
						local L_126_ = L_124_arg0:IsA(L_125_arg1)
						if L_126_ then
							L_119_ = true
						end
						return L_126_
					end
					for L_127_forvar0, L_128_forvar1 in next, L_63_.GUI:GetDescendants() do
						L_118_, L_119_ = {}, false
						if L_120_(L_128_forvar1, 'GuiObject') then
							L_119_ = true
							L_118_.BackgroundTransparency = 1
						end
						if L_120_(L_128_forvar1, 'ScrollingFrame') then
							L_118_.ScrollBarImageTransparency = 1
						end
						if L_120_(L_128_forvar1, 'TextLabel') or L_120_(L_128_forvar1, 'TextBox') then
							L_118_.TextStrokeTransparency = 1
							L_118_.TextTransparency = 1
						end
						if L_120_(L_128_forvar1, 'UIStroke') then
							L_118_.Transparency = 1
						end
						if L_120_(L_128_forvar1, 'ImageLabel') or L_120_(L_128_forvar1, 'ImageButton') then
							L_118_.ImageTransparency = 1
						end
						if L_119_ then
							L_50_:Create(L_128_forvar1, L_117_, L_118_):Play()
						end
					end
					task.delay(L_117_.Time, function()
						L_63_.GUI:Destroy()
						if typeof(L_63_.PostUnload) == 'function' then
							L_63_:SafeCallback(L_63_.PostUnload, tick())
						end
					end)
				end
			end
			function L_63_.ToggleAcrylic(L_129_arg0, L_130_arg1)
				if L_63_.CreatedWindow then
					if L_63_.UseAcrylic then
						L_63_.Acrylic = L_130_arg1
						L_63_.CreatedWindow.AcrylicPaint.Model.Transparency = L_130_arg1 and 0.98 or 1
						if L_130_arg1 then
							L_56_.Enable()
						else
							L_56_.Disable()
						end
					end
				end
			end
			function L_63_.ToggleTransparency(L_131_arg0, L_132_arg1)
				if L_63_.CreatedWindow then
					L_63_.CreatedWindow.AcrylicPaint.Frame.Background.BackgroundTransparency = L_132_arg1 and 0.35 or 0
				end
			end
			function L_63_.Notify(L_133_arg0, L_134_arg1)
				return L_59_:New(L_134_arg1)
			end
			function L_63_.Utilities.Resize(L_135_arg0, L_136_arg1, L_137_arg2)
				local L_138_, L_139_, L_140_ = L_136_arg1 / 1920, L_137_arg2 / 1080, L_51_.ViewportSize
				return L_140_.X * L_138_, L_140_.Y * L_139_
			end
			return L_63_
		end)()
	end,
	function()
		local L_141_, L_142_, L_143_ = L_1_(2)
		return (function(...)
			local L_144_ = {
				AcrylicBlur = L_143_(L_142_.AcrylicBlur),
				CreateAcrylic = L_143_(L_142_.CreateAcrylic),
				AcrylicPaint = L_143_(L_142_.AcrylicPaint)
			}
			function L_144_.init()
				local L_145_ = Instance.new'DepthOfFieldEffect'
				L_145_.FarIntensity = 0
				L_145_.InFocusRadius = 0.1
				L_145_.NearIntensity = 1
				local L_146_ = {}
				function L_144_.Enable()
					for L_148_forvar0, L_149_forvar1 in next, L_146_ do
						L_149_forvar1.Enabled = false
					end
					L_145_.Parent = game:GetService'Lighting'
				end
				function L_144_.Disable()
					for L_150_forvar0, L_151_forvar1 in next, L_146_ do
						L_151_forvar1.Enabled = L_151_forvar1.enabled
					end
					L_145_.Parent = nil
				end
				local L_147_ = function()
					local L_152_ = function(L_153_arg0)
						if L_153_arg0:IsA'DepthOfFieldEffect' then
							L_146_[L_153_arg0] = {
								enabled = L_153_arg0.Enabled
							}
						end
					end
					for L_154_forvar0, L_155_forvar1 in next, game:GetService'Lighting':GetChildren() do
						L_152_(L_155_forvar1)
					end
					if game:GetService'Workspace'.CurrentCamera then
						for L_156_forvar0, L_157_forvar1 in next, game:GetService'Workspace'.CurrentCamera:GetChildren() do
							L_152_(L_157_forvar1)
						end
					end
				end
				L_147_()
				L_144_.Enable()
			end
			return L_144_
		end)()
	end,
	function()
		local L_158_, L_159_, L_160_ = L_1_(3)
		return (function(...)
			local L_161_, L_162_, L_163_, L_164_ = L_160_(L_159_.Parent.Parent.Creator), L_160_(L_159_.Parent.CreateAcrylic), unpack(L_160_(L_159_.Parent.Utils))
			local L_165_ = Instance.new('Folder', game:GetService'Workspace'.CurrentCamera)
			local L_166_ = function(L_167_arg0)
				local L_168_ = {}
				L_167_arg0 = L_167_arg0 or 0.001
				local L_169_, L_170_ = {
					topLeft = Vector2.new(),
					topRight = Vector2.new(),
					bottomRight = Vector2.new()
				}, L_162_()
				local L_171_ = L_170_:FindFirstChildWhichIsA'SpecialMesh'
				L_170_.Parent = L_165_
				local L_172_, L_173_ = function(L_176_arg0, L_177_arg1)
					L_169_.topLeft = L_177_arg1
					L_169_.topRight = L_177_arg1 + Vector2.new(L_176_arg0.X, 0)
					L_169_.bottomRight = L_177_arg1 + L_176_arg0
				end, function()
					local L_178_ = game:GetService'Workspace'.CurrentCamera
					if L_178_ then
						L_178_ = L_178_.CFrame
					end
					local L_179_ = L_178_
					if not L_179_ then
						L_179_ = CFrame.new()
					end
					local L_180_, L_181_, L_182_, L_183_ = L_179_, L_169_.topLeft, L_169_.topRight, L_169_.bottomRight
					local L_184_, L_185_, L_186_ = L_163_(L_181_, L_167_arg0), L_163_(L_182_, L_167_arg0), L_163_(L_183_, L_167_arg0)
					local L_187_, L_188_ = (L_185_ - L_184_).Magnitude, (L_185_ - L_186_).Magnitude
					L_170_.CFrame = CFrame.fromMatrix((L_184_ + L_186_) / 2, L_180_.XVector, L_180_.YVector, L_180_.ZVector)
					if L_171_ then
						L_171_.Scale = Vector3.new(L_187_, L_188_, 0)
					end
				end
				local L_174_, L_175_ = function(L_189_arg0)
					local L_190_ = L_164_()
					local L_191_, L_192_ = L_189_arg0.AbsoluteSize - Vector2.new(L_190_, L_190_), L_189_arg0.AbsolutePosition + Vector2.new(L_190_ / 2, L_190_ / 2)
					L_172_(L_191_, L_192_)
					task.spawn(L_173_)
				end, function()
					local L_193_ = game:GetService'Workspace'.CurrentCamera
					if not L_193_ then
						return
					end
					table.insert(L_168_, L_193_:GetPropertyChangedSignal'CFrame':Connect(L_173_))
					table.insert(L_168_, L_193_:GetPropertyChangedSignal'ViewportSize':Connect(L_173_))
					table.insert(L_168_, L_193_:GetPropertyChangedSignal'FieldOfView':Connect(L_173_))
					task.spawn(L_173_)
				end
				L_170_.Destroying:Connect(function()
					for L_194_forvar0, L_195_forvar1 in L_168_ do
						pcall(function()
							L_195_forvar1:Disconnect()
						end)
					end
				end)
				L_175_()
				return L_174_, L_170_
			end
			return function(L_196_arg0)
				local L_197_, L_198_, L_199_ = {}, L_166_(L_196_arg0)
				local L_200_ = L_161_.New('Frame', {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1)
				})
				L_161_.AddSignal(L_200_:GetPropertyChangedSignal'AbsolutePosition', function()
					L_198_(L_200_)
				end)
				L_161_.AddSignal(L_200_:GetPropertyChangedSignal'AbsoluteSize', function()
					L_198_(L_200_)
				end)
				L_197_.AddParent = function(L_201_arg0)
					L_161_.AddSignal(L_201_arg0:GetPropertyChangedSignal'Visible', function()
						L_197_.SetVisibility(L_201_arg0.Visible)
					end)
				end
				L_197_.SetVisibility = function(L_202_arg0)
					L_199_.Transparency = L_202_arg0 and 0.98 or 1
				end
				L_197_.Frame = L_200_
				L_197_.Model = L_199_
				return L_197_
			end
		end)()
	end,
	function()
		local L_203_, L_204_, L_205_ = L_1_(4)
		return (function(...)
			local L_206_, L_207_ = L_205_(L_204_.Parent.Parent.Creator), L_205_(L_204_.Parent.AcrylicBlur)
			local L_208_ = L_206_.New
			return function(L_209_arg0)
				local L_210_ = {}
				L_210_.Frame = L_208_('Frame', {
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 0.9,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BorderSizePixel = 0
				}, {
					L_208_('ImageLabel', {
						Image = 'rbxassetid://8992230677',
						ScaleType = 'Slice',
						SliceCenter = Rect.new(Vector2.new(99, 99), Vector2.new(99, 99)),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Size = UDim2.new(1, 120, 1, 116),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						BackgroundTransparency = 1,
						ImageColor3 = Color3.fromRGB(0, 0, 0),
						ImageTransparency = 0.7
					}),
					L_208_('UICorner', {
						CornerRadius = UDim.new(0, 8)
					}),
					L_208_('Frame', {
						BackgroundTransparency = 0.45,
						Size = UDim2.fromScale(1, 1),
						Name = 'Background',
						ThemeTag = {
							BackgroundColor3 = 'AcrylicMain'
						}
					}, {
						L_208_('UICorner', {
							CornerRadius = UDim.new(0, 8)
						})
					}),
					L_208_('Frame', {
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 0.4,
						Size = UDim2.fromScale(1, 1)
					}, {
						L_208_('UICorner', {
							CornerRadius = UDim.new(0, 8)
						}),
						L_208_('UIGradient', {
							Rotation = 90,
							ThemeTag = {
								Color = 'AcrylicGradient'
							}
						})
					}),
					L_208_('ImageLabel', {
						Image = 'rbxassetid://9968344105',
						ImageTransparency = 0.98,
						ScaleType = Enum.ScaleType.Tile,
						TileSize = UDim2.new(0, 128, 0, 128),
						Size = UDim2.fromScale(1, 1),
						BackgroundTransparency = 1
					}, {
						L_208_('UICorner', {
							CornerRadius = UDim.new(0, 8)
						})
					}),
					L_208_('ImageLabel', {
						Image = 'rbxassetid://9968344227',
						ImageTransparency = 0.9,
						ScaleType = Enum.ScaleType.Tile,
						TileSize = UDim2.new(0, 128, 0, 128),
						Size = UDim2.fromScale(1, 1),
						BackgroundTransparency = 1,
						ThemeTag = {
							ImageTransparency = 'AcrylicNoise'
						}
					}, {
						L_208_('UICorner', {
							CornerRadius = UDim.new(0, 8)
						})
					}),
					L_208_('Frame', {
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1),
						ZIndex = 2
					}, {
						L_208_('UICorner', {
							CornerRadius = UDim.new(0, 8)
						}),
						L_208_('UIStroke', {
							Transparency = 0.5,
							Thickness = 1,
							ThemeTag = {
								Color = 'AcrylicBorder'
							}
						})
					})
				})
				local L_211_
				if L_205_(L_204_.Parent.Parent).UseAcrylic then
					L_211_ = L_207_()
					L_211_.Frame.Parent = L_210_.Frame
					L_210_.Model = L_211_.Model
					L_210_.AddParent = L_211_.AddParent
					L_210_.SetVisibility = L_211_.SetVisibility
				end
				return L_210_
			end
		end)()
	end,
	function()
		local L_212_, L_213_, L_214_ = L_1_(5)
		return (function(...)
			local L_215_ = L_213_.Parent.Parent
			local L_216_ = L_214_(L_215_.Creator)
			local L_217_ = function()
				local L_218_ = L_216_.New('Part', {
					Name = 'Body',
					Color = Color3.new(0, 0, 0),
					Material = Enum.Material.Glass,
					Size = Vector3.new(1, 1, 0),
					Anchored = true,
					CanCollide = false,
					Locked = true,
					CastShadow = false,
					Transparency = 0.98
				}, {
					L_216_.New('SpecialMesh', {
						MeshType = Enum.MeshType.Brick,
						Offset = Vector3.new(0, 0, -1)
					})
				})
				return L_218_
			end
			return L_217_
		end)()
	end,
	function()
		L_1_(6)
		return (function(...)
			local L_219_, L_220_ = function(L_222_arg0, L_223_arg1, L_224_arg2, L_225_arg3, L_226_arg4)
				return (L_222_arg0 - L_223_arg1) * (L_226_arg4 - L_225_arg3) / (L_224_arg2 - L_223_arg1) + L_225_arg3
			end, function(L_227_arg0, L_228_arg1)
				local L_229_ = game:GetService'Workspace'.CurrentCamera:ScreenPointToRay(L_227_arg0.X, L_227_arg0.Y)
				return L_229_.Origin + L_229_.Direction * L_228_arg1
			end
			local L_221_ = function()
				local L_230_ = game:GetService'Workspace'.CurrentCamera.ViewportSize.Y
				return L_219_(L_230_, 0, 2560, 8, 56)
			end
			return {
				L_220_,
				L_221_
			}
		end)()
	end,
	[8] = function()
		L_1_(8)
		return (function(...)
			return {
				Close = 'rbxassetid://9886659671',
				Min = 'rbxassetid://9886659276',
				Max = 'rbxassetid://9886659406',
				Restore = 'rbxassetid://9886659001'
			}
		end)()
	end,
	[9] = function()
		local L_231_, L_232_, L_233_ = L_1_(9)
		return (function(...)
			local L_234_ = L_232_.Parent.Parent
			local L_235_, L_236_ = L_233_(L_234_.Packages.Flipper), L_233_(L_234_.Creator)
			local L_237_, L_238_ = L_236_.New, L_235_.Spring.new
			return function(L_239_arg0, L_240_arg1, L_241_arg2)
				local L_242_ = {}
				L_241_arg2 = L_241_arg2 or false
				L_242_.Title = L_237_('TextLabel', {
					FontFace = Font.new'rbxasset://fonts/families/GothamSSm.json',
					TextColor3 = Color3.fromRGB(200, 200, 200),
					TextSize = 14,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					ThemeTag = {
						TextColor3 = 'Text'
					}
				})
				L_242_.HoverFrame = L_237_('Frame', {
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					ThemeTag = {
						BackgroundColor3 = 'Hover'
					}
				}, {
					L_237_('UICorner', {
						CornerRadius = UDim.new(0, 4)
					})
				})
				L_242_.Frame = L_237_('TextButton', {
					Size = UDim2.new(0, 0, 0, 32),
					Parent = L_240_arg1,
					ThemeTag = {
						BackgroundColor3 = 'DialogButton'
					}
				}, {
					L_237_('UICorner', {
						CornerRadius = UDim.new(0, 4)
					}),
					L_237_('UIStroke', {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
						Transparency = 0.65,
						ThemeTag = {
							Color = 'DialogButtonBorder'
						}
					}),
					L_242_.HoverFrame,
					L_242_.Title
				})
				local L_243_, L_244_ = L_236_.SpringMotor(1, L_242_.HoverFrame, 'BackgroundTransparency', L_241_arg2)
				L_236_.AddSignal(L_242_.Frame.MouseEnter, function()
					L_244_(0.97)
				end)
				L_236_.AddSignal(L_242_.Frame.MouseLeave, function()
					L_244_(1)
				end)
				L_236_.AddSignal(L_242_.Frame.MouseButton1Down, function()
					L_244_(1)
				end)
				L_236_.AddSignal(L_242_.Frame.MouseButton1Up, function()
					L_244_(0.97)
				end)
				return L_242_
			end
		end)()
	end,
	[10] = function()
		local L_245_, L_246_, L_247_ = L_1_(10)
		return (function(...)
			local L_248_ = L_246_.Parent.Parent
			local L_249_, L_250_, L_251_ = L_247_(L_248_.Creator), L_247_(L_248_.Components.Button), L_247_(L_248_.Packages.Flipper.Signal)
			local L_252_, L_253_ = L_249_.New, {
				Window = nil
			}
			function L_253_.Init(L_254_arg0, L_255_arg1)
				L_253_.Window = L_255_arg1
				return L_253_
			end
			function L_253_.Create(L_256_arg0)
				local L_257_, L_258_ = {
					Buttons = 0,
					Closing = L_251_.new(),
					Closed = L_251_.new()
				}, L_247_(L_248_)
				L_257_.TintFrame = L_252_('TextButton', {
					Text = '',
					Size = UDim2.fromScale(1, 1),
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					Parent = L_253_.Window.Root
				}, {
					L_252_('UICorner', {
						CornerRadius = UDim.new(0, 8)
					})
				})
				local L_259_, L_260_ = L_249_.SpringMotor(1, L_257_.TintFrame, 'BackgroundTransparency', true)
				L_257_.ButtonHolder = L_252_('Frame', {
					Size = UDim2.new(1, -40, 1, -40),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					BackgroundTransparency = 1
				}, {
					L_252_('UIListLayout', {
						Padding = UDim.new(0, 10),
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder
					})
				})
				L_257_.ButtonHolderFrame = L_252_('Frame', {
					Size = UDim2.new(1, 0, 0, 70),
					Position = UDim2.new(0, 0, 1, -70),
					ThemeTag = {
						BackgroundColor3 = 'DialogHolder'
					}
				}, {
					L_252_('Frame', {
						Size = UDim2.new(1, 0, 0, 1),
						ThemeTag = {
							BackgroundColor3 = 'DialogHolderLine'
						}
					}),
					L_257_.ButtonHolder
				})
				L_257_.Title = L_252_('TextLabel', {
					FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
					Text = 'Dialog',
					TextColor3 = Color3.fromRGB(240, 240, 240),
					TextSize = 22,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, 0, 0, 22),
					Position = UDim2.fromOffset(20, 25),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					ThemeTag = {
						TextColor3 = 'Text'
					}
				})
				L_257_.Scale = L_252_('UIScale', {
					Scale = 1
				})
				local L_261_, L_262_ = L_249_.SpringMotor(1.1, L_257_.Scale, 'Scale')
				L_257_.Root = L_252_('CanvasGroup', {
					Size = UDim2.fromOffset(300, 165),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					GroupTransparency = 1,
					Parent = L_257_.TintFrame,
					ThemeTag = {
						BackgroundColor3 = 'Dialog'
					}
				}, {
					L_252_('UICorner', {
						CornerRadius = UDim.new(0, 8)
					}),
					L_252_('UIStroke', {
						Transparency = 0.5,
						ThemeTag = {
							Color = 'DialogBorder'
						}
					}),
					L_257_.Scale,
					L_257_.Title,
					L_257_.ButtonHolderFrame
				})
				local L_263_, L_264_ = L_249_.SpringMotor(1, L_257_.Root, 'GroupTransparency')
				function L_257_.Open(L_265_arg0)
					L_258_.DialogOpen = true
					L_257_.Scale.Scale = 1.1
					L_260_(0.75)
					L_264_(0)
					L_262_(1)
				end
				function L_257_.Close(L_266_arg0)
					L_257_.Closing:Fire()
					L_258_.DialogOpen = false
					L_260_(1)
					L_264_(1)
					L_262_(1.1)
					L_257_.Root.UIStroke:Destroy()
					task.wait(0.15)
					L_257_.TintFrame:Destroy()
					L_257_.Closed:Fire()
				end
				function L_257_.Button(L_267_arg0, L_268_arg1, L_269_arg2)
					L_257_.Buttons = L_257_.Buttons + 1
					L_268_arg1 = L_268_arg1 or 'Button'
					L_269_arg2 = L_269_arg2 or function()
					end
					local L_270_ = L_250_('', L_257_.ButtonHolder, true)
					L_270_.Title.Text = L_268_arg1
					for L_271_forvar0, L_272_forvar1 in next, L_257_.ButtonHolder:GetChildren() do
						if L_272_forvar1:IsA'TextButton' then
							L_272_forvar1.Size = UDim2.new(1 / L_257_.Buttons, - ((L_257_.Buttons - 1) * 10 / L_257_.Buttons), 0, 32)
						end
					end
					L_249_.AddSignal(L_270_.Frame.MouseButton1Click, function()
						L_258_:SafeCallback(L_269_arg2)
						pcall(function()
							L_257_:Close()
						end)
					end)
					return L_270_
				end
				return L_257_
			end
			return L_253_
		end)()
	end,
	[11] = function()
		local L_273_, L_274_, L_275_ = L_1_(11)
		return (function(...)
			local L_276_ = L_274_.Parent.Parent
			local L_277_ = L_275_(L_276_.Creator)
			local L_278_ = L_277_.New
			return function(L_279_arg0, L_280_arg1, L_281_arg2, L_282_arg3, L_283_arg4)
				local L_284_ = {}
				L_283_arg4 = typeof(L_283_arg4) == 'table' and L_283_arg4 or {}
				L_284_.TitleLabel = L_278_('TextLabel', {
					FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Medium, Enum.FontStyle.Normal),
					Text = L_279_arg0,
					TextColor3 = Color3.fromRGB(240, 240, 240),
					TextSize = 13,
					TextXAlignment = L_283_arg4.TitleAlignment or Enum.TextXAlignment.Left,
					Size = UDim2.new(1, 0, 0, 14),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					ThemeTag = {
						TextColor3 = 'Text'
					}
				})
				L_284_.DescLabel = L_278_('TextLabel', {
					FontFace = Font.new'rbxasset://fonts/families/GothamSSm.json',
					Text = L_280_arg1,
					TextColor3 = Color3.fromRGB(200, 200, 200),
					TextSize = 12,
					TextWrapped = true,
					TextXAlignment = L_283_arg4.DescriptionAlignment or Enum.TextXAlignment.Left,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 14),
					ThemeTag = {
						TextColor3 = 'SubText'
					}
				})
				L_284_.LabelHolder = L_278_('Frame', {
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(10, 0),
					Size = UDim2.new(1, -28, 0, 0)
				}, {
					L_278_('UIListLayout', {
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					L_278_('UIPadding', {
						PaddingBottom = UDim.new(0, 13),
						PaddingTop = UDim.new(0, 13)
					}),
					L_284_.TitleLabel,
					L_284_.DescLabel
				})
				L_284_.Border = L_278_('UIStroke', {
					Transparency = 0.5,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					Color = Color3.fromRGB(0, 0, 0),
					ThemeTag = {
						Color = 'ElementBorder'
					}
				})
				L_284_.Frame = L_278_('TextButton', {
					Size = UDim2.new(1, 0, 0, 0),
					BackgroundTransparency = 0.89,
					BackgroundColor3 = Color3.fromRGB(130, 130, 130),
					Parent = L_281_arg2,
					AutomaticSize = Enum.AutomaticSize.Y,
					Text = '',
					LayoutOrder = 7,
					ThemeTag = {
						BackgroundColor3 = 'Element',
						BackgroundTransparency = 'ElementTransparency'
					}
				}, {
					L_278_('UICorner', {
						CornerRadius = UDim.new(0, 4)
					}),
					L_284_.Border,
					L_284_.LabelHolder
				})
				function L_284_.SetTitle(L_285_arg0, L_286_arg1)
					L_284_.TitleLabel.Text = L_286_arg1
				end
				function L_284_.SetDesc(L_287_arg0, L_288_arg1)
					if L_288_arg1 == nil then
						L_288_arg1 = ''
					end
					if L_288_arg1 == '' then
						L_284_.DescLabel.Visible = false
					else
						L_284_.DescLabel.Visible = true
					end
					L_284_.DescLabel.Text = L_288_arg1
				end
				function L_284_.Destroy(L_289_arg0)
					L_284_.Frame:Destroy()
				end
				L_284_:SetTitle(L_279_arg0)
				L_284_:SetDesc(L_280_arg1)
				if L_282_arg3 then
					local L_290_, L_291_, L_292_ = L_276_.Themes, L_277_.SpringMotor(L_277_.GetThemeProperty'ElementTransparency', L_284_.Frame, 'BackgroundTransparency', false, true)
					L_277_.AddSignal(L_284_.Frame.MouseEnter, function()
						L_292_(L_277_.GetThemeProperty'ElementTransparency' - L_277_.GetThemeProperty'HoverChange')
					end)
					L_277_.AddSignal(L_284_.Frame.MouseLeave, function()
						L_292_(L_277_.GetThemeProperty'ElementTransparency')
					end)
					L_277_.AddSignal(L_284_.Frame.MouseButton1Down, function()
						L_292_(L_277_.GetThemeProperty'ElementTransparency' + L_277_.GetThemeProperty'HoverChange')
					end)
					L_277_.AddSignal(L_284_.Frame.MouseButton1Up, function()
						L_292_(L_277_.GetThemeProperty'ElementTransparency' - L_277_.GetThemeProperty'HoverChange')
					end)
				end
				return setmetatable(L_284_, {
					__newindex = function(L_293_arg0, L_294_arg1, L_295_arg2)
						if L_294_arg1 == 'Title' then
							L_284_:SetTitle(L_295_arg2)
						elseif L_294_arg1 == 'Description' or L_294_arg1 == 'Desc' then
							L_284_:SetDesc(L_295_arg2)
						end
						return rawset(L_293_arg0, L_294_arg1, L_295_arg2)
					end
				})
			end
		end)()
	end,
	[12] = function()
		local L_296_, L_297_, L_298_ = L_1_(12)
		return (function(...)
			local L_299_ = L_297_.Parent.Parent
			local L_300_, L_301_, L_302_ = L_298_(L_299_.Packages.Flipper), L_298_(L_299_.Creator), L_298_(L_299_.Acrylic)
			local L_303_, L_304_, L_305_, L_306_ = L_300_.Spring.new, L_300_.Instant.new, L_301_.New, {}
			function L_306_.Init(L_307_arg0, L_308_arg1)
				L_306_.Holder = L_305_('Frame', {
					Position = UDim2.new(1, -30, 1, -30),
					Size = UDim2.new(0, 310, 1, -30),
					AnchorPoint = Vector2.new(1, 1),
					BackgroundTransparency = 1,
					Parent = L_308_arg1
				}, {
					L_305_('UIListLayout', {
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Bottom,
						Padding = UDim.new(0, 20)
					})
				})
			end
			function L_306_.New(L_309_arg0, L_310_arg1)
				local L_311_ = {
					Closed = false
				}
				L_310_arg1.Title = L_310_arg1.Title or 'Title'
				L_310_arg1.Content = L_310_arg1.Content or 'Content'
				L_310_arg1.SubContent = L_310_arg1.SubContent or ''
				L_310_arg1.Duration = L_310_arg1.Duration or nil
				L_310_arg1.Buttons = L_310_arg1.Buttons or {}
				L_311_.AcrylicPaint = L_302_.AcrylicPaint()
				L_311_.Title = L_305_('TextLabel', {
					Position = UDim2.new(0, 14, 0, 17),
					Text = L_310_arg1.Title,
					RichText = true,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextTransparency = 0,
					FontFace = Font.new'rbxasset://fonts/families/GothamSSm.json',
					TextSize = 13,
					TextXAlignment = 'Left',
					TextYAlignment = 'Center',
					Size = UDim2.new(1, -12, 0, 12),
					TextWrapped = true,
					BackgroundTransparency = 1,
					ThemeTag = {
						TextColor3 = 'Text'
					}
				})
				L_311_.ContentLabel = L_305_('TextLabel', {
					FontFace = Font.new'rbxasset://fonts/families/GothamSSm.json',
					Text = L_310_arg1.Content,
					TextColor3 = Color3.fromRGB(240, 240, 240),
					TextSize = 14,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 14),
					BackgroundTransparency = 1,
					TextWrapped = true,
					ThemeTag = {
						TextColor3 = 'Text'
					}
				})
				L_311_.SubContentLabel = L_305_('TextLabel', {
					FontFace = Font.new'rbxasset://fonts/families/GothamSSm.json',
					Text = L_310_arg1.SubContent,
					TextColor3 = Color3.fromRGB(240, 240, 240),
					TextSize = 14,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 14),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					TextWrapped = true,
					ThemeTag = {
						TextColor3 = 'SubText'
					}
				})
				L_311_.LabelHolder = L_305_('Frame', {
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(14, 40),
					Size = UDim2.new(1, -28, 0, 0)
				}, {
					L_305_('UIListLayout', {
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						Padding = UDim.new(0, 3)
					}),
					L_311_.ContentLabel,
					L_311_.SubContentLabel
				})
				L_311_.CloseButton = L_305_('TextButton', {
					Text = '',
					Position = UDim2.new(1, -14, 0, 13),
					Size = UDim2.fromOffset(20, 20),
					AnchorPoint = Vector2.new(1, 0),
					BackgroundTransparency = 1
				}, {
					L_305_('ImageLabel', {
						Image = L_298_(L_297_.Parent.Assets).Close,
						Size = UDim2.fromOffset(16, 16),
						Position = UDim2.fromScale(0.5, 0.5),
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundTransparency = 1,
						ThemeTag = {
							ImageColor3 = 'Text'
						}
					})
				})
				L_311_.Root = L_305_('Frame', {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					Position = UDim2.fromScale(1, 0)
				}, {
					L_311_.AcrylicPaint.Frame,
					L_311_.Title,
					L_311_.CloseButton,
					L_311_.LabelHolder
				})
				if L_310_arg1.Content == '' then
					L_311_.ContentLabel.Visible = false
				end
				if L_310_arg1.SubContent == '' then
					L_311_.SubContentLabel.Visible = false
				end
				L_311_.Holder = L_305_('Frame', {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 200),
					Parent = L_306_.Holder
				}, {
					L_311_.Root
				})
				local L_312_ = L_300_.GroupMotor.new{
					Scale = 1,
					Offset = 60
				}
				L_312_:onStep(function(L_313_arg0)
					L_311_.Root.Position = UDim2.new(L_313_arg0.Scale, L_313_arg0.Offset, 0, 0)
				end)
				L_301_.AddSignal(L_311_.CloseButton.MouseButton1Click, function()
					L_311_:Close()
				end)
				function L_311_.Open(L_314_arg0)
					local L_315_ = L_311_.LabelHolder.AbsoluteSize.Y
					L_311_.Holder.Size = UDim2.new(1, 0, 0, 58 + L_315_)
					L_312_:setGoal{
						Scale = L_303_(0, {
							frequency = 5
						}),
						Offset = L_303_(0, {
							frequency = 5
						})
					}
				end
				function L_311_.Close(L_316_arg0)
					if not L_311_.Closed then
						L_311_.Closed = true
						task.spawn(function()
							L_312_:setGoal{
								Scale = L_303_(1, {
									frequency = 5
								}),
								Offset = L_303_(60, {
									frequency = 5
								})
							}
							task.wait(0.4)
							if L_298_(L_299_).UseAcrylic then
								L_311_.AcrylicPaint.Model:Destroy()
							end
							L_311_.Holder:Destroy()
						end)
					end
				end
				L_311_:Open()
				if L_310_arg1.Duration then
					task.delay(L_310_arg1.Duration, function()
						L_311_:Close()
					end)
				end
				return L_311_
			end
			return L_306_
		end)()
	end,
	[13] = function()
		local L_317_, L_318_, L_319_ = L_1_(13)
		return (function(...)
			local L_320_ = L_318_.Parent.Parent
			local L_321_ = L_319_(L_320_.Creator)
			local L_322_ = L_321_.New
			return function(L_323_arg0, L_324_arg1)
				local L_325_ = {}
				L_325_.Layout = L_322_('UIListLayout', {
					Padding = UDim.new(0, 5)
				})
				L_325_.Container = L_322_('Frame', {
					Size = UDim2.new(1, 0, 0, 26),
					Position = UDim2.fromOffset(0, 24),
					BackgroundTransparency = 1
				}, {
					L_325_.Layout
				})
				L_325_.Root = L_322_('Frame', {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 26),
					LayoutOrder = 7,
					Parent = L_324_arg1
				}, {
					L_322_('TextLabel', {
						RichText = true,
						Text = L_323_arg0,
						TextTransparency = 0,
						FontFace = Font.new('rbxassetid://12187365364', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
						TextSize = 18,
						TextXAlignment = 'Left',
						TextYAlignment = 'Center',
						Size = UDim2.new(1, -16, 0, 18),
						Position = UDim2.fromOffset(0, 2),
						ThemeTag = {
							TextColor3 = 'Text'
						}
					}),
					L_325_.Container
				})
				L_321_.AddSignal(L_325_.Layout:GetPropertyChangedSignal'AbsoluteContentSize', function()
					L_325_.Container.Size = UDim2.new(1, 0, 0, L_325_.Layout.AbsoluteContentSize.Y)
					L_325_.Root.Size = UDim2.new(1, 0, 0, L_325_.Layout.AbsoluteContentSize.Y + 25)
				end)
				return L_325_
			end
		end)()
	end,
	[14] = function()
		local L_326_, L_327_, L_328_ = L_1_(14)
		return (function(...)
			local L_329_ = L_327_.Parent.Parent
			local L_330_, L_331_ = L_328_(L_329_.Packages.Flipper), L_328_(L_329_.Creator)
			local L_332_, L_333_, L_334_, L_335_, L_336_ = L_331_.New, L_330_.Spring.new, L_330_.Instant.new, L_329_.Components, {
				Window = nil,
				Tabs = {},
				Containers = {},
				SelectedTab = 0,
				TabCount = 0
			}
			function L_336_.Init(L_337_arg0, L_338_arg1)
				L_336_.Window = L_338_arg1
				return L_336_
			end
			function L_336_.GetCurrentTabPos(L_339_arg0)
				local L_340_, L_341_ = L_336_.Window.TabHolder.AbsolutePosition.Y, L_336_.Tabs[L_336_.SelectedTab].Frame.AbsolutePosition.Y
				return L_341_ - L_340_
			end
			function L_336_.New(L_342_arg0, L_343_arg1, L_344_arg2, L_345_arg3)
				local L_346_, L_347_ = L_328_(L_329_), L_336_.Window
				local L_348_ = L_346_.Elements
				L_336_.TabCount = L_336_.TabCount + 1
				local L_349_, L_350_ = L_336_.TabCount, {
					Selected = false,
					Name = L_343_arg1,
					Type = 'Tab'
				}
				L_344_arg2 = L_346_.Utilities:GetIcon(L_344_arg2)
				L_350_.Frame = L_332_('TextButton', {
					Size = UDim2.new(1, 0, 0, 34),
					BackgroundTransparency = 1,
					Parent = L_345_arg3,
					ThemeTag = {
						BackgroundColor3 = 'Tab'
					}
				}, {
					L_332_('UICorner', {
						CornerRadius = UDim.new(0, 6)
					}),
					L_332_('TextLabel', {
						AnchorPoint = Vector2.new(0, 0.5),
						Position = L_344_arg2 ~= nil and UDim2.new(0, 30, 0.5, 0) or UDim2.new(0, 12, 0.5, 0),
						Text = L_343_arg1,
						RichText = true,
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextTransparency = 0,
						FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal),
						TextSize = 12,
						TextXAlignment = 'Left',
						TextYAlignment = 'Center',
						Size = UDim2.new(1, -12, 1, 0),
						BackgroundTransparency = 1,
						ThemeTag = {
							TextColor3 = 'Text'
						}
					}),
					L_332_('ImageLabel', {
						AnchorPoint = Vector2.new(0, 0.5),
						Size = UDim2.fromOffset(16, 16),
						Position = UDim2.new(0, 8, 0.5, 0),
						BackgroundTransparency = 1,
						ImageRectOffset = L_344_arg2 and L_344_arg2.ImageRectOffset or Vector2.new(),
						ImageRectSize = L_344_arg2 and L_344_arg2.ImageRectSize or Vector2.new(),
						Image = L_344_arg2 and L_344_arg2.Image or nil,
						ThemeTag = {
							ImageColor3 = 'Text'
						}
					})
				})
				local L_351_ = L_332_('UIListLayout', {
					Padding = UDim.new(0, 5),
					SortOrder = Enum.SortOrder.LayoutOrder
				})
				L_350_.ContainerFrame = L_332_('ScrollingFrame', {
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					Parent = L_347_.ContainerHolder,
					Visible = false,
					BottomImage = 'rbxassetid://6889812791',
					MidImage = 'rbxassetid://6889812721',
					TopImage = 'rbxassetid://6276641225',
					ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
					ScrollBarImageTransparency = 0.95,
					ScrollBarThickness = 3,
					BorderSizePixel = 0,
					CanvasSize = UDim2.fromScale(0, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y
				}, {
					L_351_,
					L_332_('UIPadding', {
						PaddingRight = UDim.new(0, 10),
						PaddingLeft = UDim.new(0, 1),
						PaddingTop = UDim.new(0, 1),
						PaddingBottom = UDim.new(0, 1)
					})
				})
				L_331_.AddSignal(L_351_:GetPropertyChangedSignal'AbsoluteContentSize', function()
					L_350_.ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, L_351_.AbsoluteContentSize.Y + 2)
				end)
				L_350_.Motor, L_350_.SetTransparency = L_331_.SpringMotor(1, L_350_.Frame, 'BackgroundTransparency')
				L_331_.AddSignal(L_350_.Frame.MouseEnter, function()
					L_350_.SetTransparency(L_350_.Selected and 0.85 or 0.89)
				end)
				L_331_.AddSignal(L_350_.Frame.MouseLeave, function()
					L_350_.SetTransparency(L_350_.Selected and 0.89 or 1)
				end)
				L_331_.AddSignal(L_350_.Frame.MouseButton1Down, function()
					L_350_.SetTransparency(0.92)
				end)
				L_331_.AddSignal(L_350_.Frame.MouseButton1Up, function()
					L_350_.SetTransparency(L_350_.Selected and 0.85 or 0.89)
				end)
				L_331_.AddSignal(L_350_.Frame.MouseButton1Click, function()
					L_336_:SelectTab(L_349_)
				end)
				L_336_.Containers[L_349_] = L_350_.ContainerFrame
				L_336_.Tabs[L_349_] = L_350_
				L_350_.Container = L_350_.ContainerFrame
				L_350_.ScrollFrame = L_350_.Container
				function L_350_.Section(L_352_arg0, L_353_arg1)
					local L_354_, L_355_ = {
						Type = 'Section'
					}, L_328_(L_335_.Section)(L_353_arg1, L_350_.Container)
					L_354_.Container = L_355_.Container
					L_354_.ScrollFrame = L_350_.Container
					setmetatable(L_354_, L_348_)
					return L_354_
				end
				L_350_.CreateSection = L_350_.Section
				L_350_.AddSection = L_350_.Section
				setmetatable(L_350_, L_348_)
				return L_350_
			end
			function L_336_.SelectTab(L_356_arg0, L_357_arg1)
				local L_358_ = L_336_.Window
				L_336_.SelectedTab = L_357_arg1
				for L_359_forvar0, L_360_forvar1 in next, L_336_.Tabs do
					L_360_forvar1.SetTransparency(1)
					L_360_forvar1.Selected = false
				end
				L_336_.Tabs[L_357_arg1].SetTransparency(0.89)
				L_336_.Tabs[L_357_arg1].Selected = true
				L_358_.TabDisplay.Text = L_336_.Tabs[L_357_arg1].Name
				L_358_.SelectorPosMotor:setGoal(L_333_(L_336_:GetCurrentTabPos(), {
					frequency = 6
				}))
				task.spawn(function()
					L_358_.ContainerHolder.Parent = L_358_.ContainerAnim
					L_358_.ContainerPosMotor:setGoal(L_333_(15, {
						frequency = 10
					}))
					L_358_.ContainerBackMotor:setGoal(L_333_(1, {
						frequency = 10
					}))
					task.wait(0.12)
					for L_361_forvar0, L_362_forvar1 in next, L_336_.Containers do
						L_362_forvar1.Visible = false
					end
					L_336_.Containers[L_357_arg1].Visible = true
					L_358_.ContainerPosMotor:setGoal(L_333_(0, {
						frequency = 5
					}))
					L_358_.ContainerBackMotor:setGoal(L_333_(0, {
						frequency = 8
					}))
					task.wait(0.12)
					L_358_.ContainerHolder.Parent = L_358_.ContainerCanvas
				end)
			end
			return L_336_
		end)()
	end,
	[15] = function()
		local L_363_, L_364_, L_365_ = L_1_(15)
		return (function(...)
			local L_366_, L_367_ = game:GetService'TextService', L_364_.Parent.Parent
			local L_368_, L_369_ = L_365_(L_367_.Packages.Flipper), L_365_(L_367_.Creator)
			local L_370_ = L_369_.New
			return function(L_371_arg0, L_372_arg1)
				local L_373_ = {}
				L_372_arg1 = L_372_arg1 or false
				L_373_.Input = L_370_('TextBox', {
					FontFace = Font.new'rbxasset://fonts/families/GothamSSm.json',
					TextColor3 = Color3.fromRGB(200, 200, 200),
					TextSize = 14,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.fromOffset(10, 0),
					ThemeTag = {
						TextColor3 = 'Text',
						PlaceholderColor3 = 'SubText'
					}
				})
				L_373_.Container = L_370_('Frame', {
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					Position = UDim2.new(0, 6, 0, 0),
					Size = UDim2.new(1, -12, 1, 0)
				}, {
					L_373_.Input
				})
				L_373_.Indicator = L_370_('Frame', {
					Size = UDim2.new(1, -4, 0, 1),
					Position = UDim2.new(0, 2, 1, 0),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundTransparency = L_372_arg1 and 0.5 or 0,
					ThemeTag = {
						BackgroundColor3 = L_372_arg1 and 'InputIndicator' or 'DialogInputLine'
					}
				})
				L_373_.Frame = L_370_('Frame', {
					Size = UDim2.new(0, 0, 0, 30),
					BackgroundTransparency = L_372_arg1 and 0.9 or 0,
					Parent = L_371_arg0,
					ThemeTag = {
						BackgroundColor3 = L_372_arg1 and 'Input' or 'DialogInput'
					}
				}, {
					L_370_('UICorner', {
						CornerRadius = UDim.new(0, 4)
					}),
					L_370_('UIStroke', {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
						Transparency = L_372_arg1 and 0.5 or 0.65,
						ThemeTag = {
							Color = L_372_arg1 and 'InElementBorder' or 'DialogButtonBorder'
						}
					}),
					L_373_.Indicator,
					L_373_.Container
				})
				local L_374_ = function()
					local L_375_, L_376_ = 2, L_373_.Container.AbsoluteSize.X
					if not L_373_.Input:IsFocused() or L_373_.Input.TextBounds.X <= L_376_ - 2 * L_375_ then
						L_373_.Input.Position = UDim2.new(0, L_375_, 0, 0)
					else
						local L_377_ = L_373_.Input.CursorPosition
						if L_377_ ~= -1 then
							local L_378_ = string.sub(L_373_.Input.Text, 1, L_377_ - 1)
							local L_379_ = L_366_:GetTextSize(L_378_, L_373_.Input.TextSize, L_373_.Input.Font, Vector2.new(math.huge, math.huge)).X
							local L_380_ = L_373_.Input.Position.X.Offset + L_379_
							if L_380_ < L_375_ then
								L_373_.Input.Position = UDim2.fromOffset(L_375_ - L_379_, 0)
							elseif L_380_ > L_376_ - L_375_ - 1 then
								L_373_.Input.Position = UDim2.fromOffset(L_376_ - L_379_ - L_375_ - 1, 0)
							end
						end
					end
				end
				task.spawn(L_374_)
				L_369_.AddSignal(L_373_.Input:GetPropertyChangedSignal'Text', L_374_)
				L_369_.AddSignal(L_373_.Input:GetPropertyChangedSignal'CursorPosition', L_374_)
				L_369_.AddSignal(L_373_.Input.Focused, function()
					L_374_()
					L_373_.Indicator.Size = UDim2.new(1, -2, 0, 2)
					L_373_.Indicator.Position = UDim2.new(0, 1, 1, 0)
					L_373_.Indicator.BackgroundTransparency = 0
					L_369_.OverrideTag(L_373_.Frame, {
						BackgroundColor3 = L_372_arg1 and 'InputFocused' or 'DialogHolder'
					})
					L_369_.OverrideTag(L_373_.Indicator, {
						BackgroundColor3 = 'Accent'
					})
				end)
				L_369_.AddSignal(L_373_.Input.FocusLost, function()
					L_374_()
					L_373_.Indicator.Size = UDim2.new(1, -4, 0, 1)
					L_373_.Indicator.Position = UDim2.new(0, 2, 1, 0)
					L_373_.Indicator.BackgroundTransparency = 0.5
					L_369_.OverrideTag(L_373_.Frame, {
						BackgroundColor3 = L_372_arg1 and 'Input' or 'DialogInput'
					})
					L_369_.OverrideTag(L_373_.Indicator, {
						BackgroundColor3 = L_372_arg1 and 'InputIndicator' or 'DialogInputLine'
					})
				end)
				return L_373_
			end
		end)()
	end,
	[16] = function()
		local L_381_, L_382_, L_383_ = L_1_(16)
		return (function(...)
			local L_384_ = L_382_.Parent.Parent
			local L_385_ = L_383_(L_384_.Creator)
			local L_386_, L_387_ = L_385_.New, L_385_.AddSignal
			return function(L_388_arg0)
				local L_389_, L_390_, L_391_ = {}, L_383_(L_384_), function(L_392_arg0, L_393_arg1, L_394_arg2, L_395_arg3, L_396_arg4)
					local L_397_ = {
						Callback = L_396_arg4 or function()
						end,
						OnDebounce = false
					}
					L_397_.Frame = L_386_('TextButton', {
						Size = UDim2.new(0, 34, 1, -8),
						AnchorPoint = Vector2.new(1, 0),
						BackgroundTransparency = 1,
						Parent = L_394_arg2,
						Position = L_393_arg1,
						Text = '',
						ThemeTag = {
							BackgroundColor3 = 'Text'
						}
					}, {
						L_386_('UICorner', {
							CornerRadius = UDim.new(0, 7)
						}),
						L_386_('ImageLabel', {
							Image = L_392_arg0,
							Size = UDim2.fromOffset(16, 16),
							Position = UDim2.fromScale(0.5, 0.5),
							AnchorPoint = Vector2.new(0.5, 0.5),
							BackgroundTransparency = 1,
							Name = 'Icon',
							ThemeTag = {
								ImageColor3 = 'Text'
							}
						})
					})
					local L_398_, L_399_ = L_385_.SpringMotor(1, L_397_.Frame, 'BackgroundTransparency')
					L_387_(L_397_.Frame.MouseEnter, function()
						L_399_(0.94)
					end)
					L_387_(L_397_.Frame.MouseLeave, function()
						L_399_(1, true)
					end)
					L_387_(L_397_.Frame.MouseButton1Down, function()
						L_399_(0.96)
					end)
					L_387_(L_397_.Frame.MouseButton1Up, function()
						L_399_(0.94)
					end)
					L_387_(L_397_.Frame.MouseButton1Click, function(...)
						if not L_397_.OnDebounce then
							L_397_.OnDebounce = true
							task.delay(L_395_arg3, rawset, L_397_, 'OnDebounce', false)
							L_397_.Callback(...)
						end
					end)
					return L_397_
				end
				L_389_.Frame = L_386_('Frame', {
					Size = UDim2.new(1, 0, 0, 42),
					BackgroundTransparency = 1,
					Parent = L_388_arg0.Parent
				}, {
					L_386_('Frame', {
						BackgroundTransparency = 0.5,
						Size = UDim2.new(1, 0, 0, 1),
						Position = UDim2.new(0, 0, 1, 0),
						ThemeTag = {
							BackgroundColor3 = 'TitleBarLine'
						}
					})
				})
				L_389_.TitleHolder = L_386_('Frame', {
					Size = UDim2.new(1, -16, 1, 0),
					Parent = L_389_.Frame,
					Position = UDim2.new(0, 16, 0, 0),
					BackgroundTransparency = 1
				}, {
					L_386_('UIListLayout', {
						Padding = UDim.new(0, 5),
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder
					})
				})
				L_389_.Title = L_386_('TextLabel', {
					RichText = true,
					Text = L_388_arg0.Title,
					Parent = L_389_.TitleHolder,
					FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal),
					TextSize = 12,
					TextXAlignment = 'Left',
					TextYAlignment = 'Center',
					Size = UDim2.fromScale(0, 1),
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundTransparency = 1,
					ThemeTag = {
						TextColor3 = 'Text'
					}
				})
				L_389_.SubTitle = L_386_('TextLabel', {
					RichText = true,
					Text = L_388_arg0.SubTitle,
					Parent = L_389_.TitleHolder,
					TextTransparency = 0.4,
					FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal),
					TextSize = 12,
					TextXAlignment = 'Left',
					TextYAlignment = 'Center',
					Size = UDim2.fromScale(0, 1),
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundTransparency = 1,
					ThemeTag = {
						TextColor3 = 'Text'
					}
				})
				L_389_.CloseButton = L_391_(L_390_.Utilities:GetIcon'Close', UDim2.new(1, -4, 0, 4), L_389_.Frame, 0, function()
					L_390_.CreatedWindow:Dialog{
						Title = 'Close',
						Content = 'Are you sure you want to unload the interface?',
						Buttons = {
							{
								Title = 'Yes',
								Callback = L_390_.Destroy
							},
							{
								Title = 'No'
							}
						}
					}
				end)
				L_389_.MaxButton = L_391_(L_390_.Utilities:GetIcon'Max', UDim2.new(1, -40, 0, 4), L_389_.Frame, 0, function()
					L_388_arg0.Window.Maximize(not L_388_arg0.Window.Maximized)
				end)
				L_389_.MinButton = L_391_(L_390_.Utilities:GetIcon'Min', UDim2.new(1, -80, 0, 4), L_389_.Frame, 0, function()
					L_390_.Window:Minimize()
				end)
				return L_389_
			end
		end)()
	end,
	[17] = function()
		local L_400_, L_401_, L_402_ = L_1_(17)
		return (function(...)
			local L_403_ = L_401_.Parent.Parent
			local L_404_, L_405_, L_406_, L_407_, L_408_, L_409_ = L_402_(L_403_.Packages.Flipper), L_402_(L_403_.Creator), L_402_(L_403_.Acrylic), L_402_(L_401_.Parent.Assets), L_401_.Parent, L_402_(L_403_)
			local L_410_, L_411_, L_412_, L_413_, L_414_, L_415_ = L_409_.Utilities:Clone(game:GetService'UserInputService'), L_409_.Utilities:Clone(game:GetService'Players').LocalPlayer:GetMouse(), L_409_.Utilities:Clone(game:GetService'Workspace').CurrentCamera, L_404_.Spring.new, L_404_.Instant.new, L_405_.New
			return function(L_416_arg0)
				local L_417_, L_418_, L_419_, L_420_, L_421_ = {
					Minimized = false,
					Maximized = false,
					Size = L_416_arg0.Size,
					MinSize = L_416_arg0.MinSize,
					CurrentPos = 0,
					TabWidth = 0,
					Position = UDim2.fromOffset(L_412_.ViewportSize.X / 2 - L_416_arg0.Size.X.Offset / 2, L_412_.ViewportSize.Y / 2 - L_416_arg0.Size.Y.Offset / 2)
				}, false
				local L_422_, L_423_ = false
				local L_424_ = false
				L_417_.AcrylicPaint = L_406_.AcrylicPaint()
				L_417_.TabWidth = L_416_arg0.TabWidth
				local L_425_, L_426_ = L_415_('Frame', {
					Size = UDim2.fromOffset(4, 0),
					BackgroundColor3 = Color3.fromRGB(76, 194, 255),
					Position = UDim2.fromOffset(0, 17),
					AnchorPoint = Vector2.new(0, 0.5),
					ThemeTag = {
						BackgroundColor3 = 'Accent'
					}
				}, {
					L_415_('UICorner', {
						CornerRadius = UDim.new(0, 2)
					})
				}), L_415_('Frame', {
					Size = UDim2.fromOffset(20, 20),
					BackgroundTransparency = 1,
					Position = UDim2.new(1, -20, 1, -20)
				})
				L_417_.TabHolder = L_415_('ScrollingFrame', {
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					ScrollBarImageTransparency = 1,
					ScrollBarThickness = 0,
					BorderSizePixel = 0,
					CanvasSize = UDim2.fromScale(0, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y
				}, {
					L_415_('UIListLayout', {
						Padding = UDim.new(0, 4)
					})
				})
				local L_427_ = L_415_('Frame', {
					Size = UDim2.new(0, L_417_.TabWidth, 1, -66),
					Position = UDim2.new(0, 12, 0, 54),
					BackgroundTransparency = 1,
					ClipsDescendants = true
				}, {
					L_417_.TabHolder,
					L_425_
				})
				L_417_.TabDisplay = L_415_('TextLabel', {
					RichText = true,
					Text = 'Tab',
					TextTransparency = 0,
					FontFace = Font.new('rbxassetid://12187365364', Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
					TextSize = 28,
					TextXAlignment = 'Left',
					TextYAlignment = 'Center',
					Size = UDim2.new(1, -16, 0, 28),
					Position = UDim2.fromOffset(L_417_.TabWidth + 26, 56),
					BackgroundTransparency = 1,
					ThemeTag = {
						TextColor3 = 'Text'
					}
				})
				L_417_.ContainerHolder = L_415_('Frame', {
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1
				})
				L_417_.ContainerAnim = L_415_('CanvasGroup', {
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1
				})
				L_417_.ContainerCanvas = L_415_('Frame', {
					Size = UDim2.new(1, - L_417_.TabWidth - 32, 1, -102),
					Position = UDim2.fromOffset(L_417_.TabWidth + 26, 90),
					BackgroundTransparency = 1
				}, {
					L_417_.ContainerAnim,
					L_417_.ContainerHolder
				})
				L_417_.Root = L_415_('Frame', {
					BackgroundTransparency = 1,
					Size = L_417_.Size,
					Position = L_417_.Position,
					Parent = L_416_arg0.Parent
				}, {
					L_417_.AcrylicPaint.Frame,
					L_417_.TabDisplay,
					L_417_.ContainerCanvas,
					L_427_,
					L_426_
				})
				L_417_.TitleBar = L_402_(L_401_.Parent.TitleBar){
					Title = L_416_arg0.Title,
					SubTitle = L_416_arg0.SubTitle,
					Parent = L_417_.Root,
					Window = L_417_
				}
				if L_402_(L_403_).UseAcrylic then
					L_417_.AcrylicPaint.AddParent(L_417_.Root)
				end
				local L_428_, L_429_ = L_404_.GroupMotor.new{
					X = L_417_.Size.X.Offset,
					Y = L_417_.Size.Y.Offset
				}, L_404_.GroupMotor.new{
					X = L_417_.Position.X.Offset,
					Y = L_417_.Position.Y.Offset
				}
				L_417_.SelectorPosMotor = L_404_.SingleMotor.new(17)
				L_417_.SelectorSizeMotor = L_404_.SingleMotor.new(0)
				L_417_.ContainerBackMotor = L_404_.SingleMotor.new(0)
				L_417_.ContainerPosMotor = L_404_.SingleMotor.new(94)
				L_428_:onStep(function(L_436_arg0)
					L_417_.Root.Size = UDim2.new(0, L_436_arg0.X, 0, L_436_arg0.Y)
				end)
				L_429_:onStep(function(L_437_arg0)
					L_417_.Root.Position = UDim2.new(0, L_437_arg0.X, 0, L_437_arg0.Y)
				end)
				local L_430_, L_431_ = 0, 0
				L_417_.SelectorPosMotor:onStep(function(L_438_arg0)
					L_425_.Position = UDim2.new(0, 0, 0, L_438_arg0 + 17)
					local L_439_ = tick()
					local L_440_ = L_439_ - L_431_
					if L_430_ ~= nil then
						L_417_.SelectorSizeMotor:setGoal(L_413_((math.abs(L_438_arg0 - L_430_) / (L_440_ * 60)) + 16))
						L_430_ = L_438_arg0
					end
					L_431_ = L_439_
				end)
				L_417_.SelectorSizeMotor:onStep(function(L_441_arg0)
					L_425_.Size = UDim2.new(0, 4, 0, L_441_arg0)
				end)
				L_417_.ContainerBackMotor:onStep(function(L_442_arg0)
					L_417_.ContainerAnim.GroupTransparency = L_442_arg0
				end)
				L_417_.ContainerPosMotor:onStep(function(L_443_arg0)
					L_417_.ContainerAnim.Position = UDim2.fromOffset(0, L_443_arg0)
				end)
				local L_432_, L_433_
				L_417_.Maximize = function(L_444_arg0, L_445_arg1, L_446_arg2)
					L_417_.Maximized = L_444_arg0
					L_417_.TitleBar.MaxButton.Frame.Icon.Image = L_444_arg0 and L_407_.Restore or L_407_.Max
					if L_444_arg0 then
						L_432_ = L_417_.Size.X.Offset
						L_433_ = L_417_.Size.Y.Offset
					end
					local L_447_, L_448_ = L_444_arg0 and L_412_.ViewportSize.X or L_432_, L_444_arg0 and L_412_.ViewportSize.Y or L_433_
					L_428_:setGoal{
						X = L_404_[L_446_arg2 and 'Instant' or 'Spring'].new(L_447_, {
							frequency = 6
						}),
						Y = L_404_[L_446_arg2 and 'Instant' or 'Spring'].new(L_448_, {
							frequency = 6
						})
					}
					L_417_.Size = UDim2.fromOffset(L_447_, L_448_)
					if not L_445_arg1 then
						L_429_:setGoal{
							X = L_413_(L_444_arg0 and 0 or L_417_.Position.X.Offset, {
								frequency = 6
							}),
							Y = L_413_(L_444_arg0 and 0 or L_417_.Position.Y.Offset, {
								frequency = 6
							})
						}
					end
				end
				L_405_.AddSignal(L_417_.TitleBar.Frame.InputBegan, function(L_449_arg0)
					if L_449_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_449_arg0.UserInputType == Enum.UserInputType.Touch then
						L_418_ = true
						L_420_ = L_449_arg0.Position
						L_421_ = L_417_.Root.Position
						if L_417_.Maximized then
							L_421_ = UDim2.fromOffset(L_411_.X - (L_411_.X * ((L_432_ - 100) / L_417_.Root.AbsoluteSize.X)), L_411_.Y - (L_411_.Y * (L_433_ / L_417_.Root.AbsoluteSize.Y)))
						end
						L_449_arg0.Changed:Connect(function()
							if L_449_arg0.UserInputState == Enum.UserInputState.End then
								L_418_ = false
							end
						end)
					end
				end)
				L_405_.AddSignal(L_417_.TitleBar.Frame.InputChanged, function(L_450_arg0)
					if L_450_arg0.UserInputType == Enum.UserInputType.MouseMovement or L_450_arg0.UserInputType == Enum.UserInputType.Touch then
						L_419_ = L_450_arg0
					end
				end)
				L_405_.AddSignal(L_426_.InputBegan, function(L_451_arg0)
					if L_451_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_451_arg0.UserInputType == Enum.UserInputType.Touch then
						L_422_ = true
						L_423_ = L_451_arg0.Position
					end
				end)
				L_405_.AddSignal(L_410_.InputChanged, function(L_452_arg0)
					if L_452_arg0 == L_419_ and L_418_ then
						local L_453_ = L_452_arg0.Position - L_420_
						L_417_.Position = UDim2.fromOffset(L_421_.X.Offset + L_453_.X, L_421_.Y.Offset + L_453_.Y)
						L_429_:setGoal{
							X = L_414_(L_417_.Position.X.Offset),
							Y = L_414_(L_417_.Position.Y.Offset)
						}
						if L_417_.Maximized then
							L_417_.Maximize(false, true, true)
						end
					end
					if (L_452_arg0.UserInputType == Enum.UserInputType.MouseMovement or L_452_arg0.UserInputType == Enum.UserInputType.Touch) and L_422_ then
						local L_454_, L_455_ = L_452_arg0.Position - L_423_, L_417_.Size
						local L_456_ = Vector3.new(L_455_.X.Offset, L_455_.Y.Offset, 0) + Vector3.new(1, 1, 0) * L_454_
						local L_457_ = Vector2.new(math.clamp(L_456_.X, L_417_.MinSize.X, 2048), math.clamp(L_456_.Y, L_417_.MinSize.Y, 2048))
						L_428_:setGoal{
							X = L_404_.Instant.new(L_457_.X),
							Y = L_404_.Instant.new(L_457_.Y)
						}
					end
				end)
				L_405_.AddSignal(L_410_.InputEnded, function(L_458_arg0)
					if L_422_ == true or L_458_arg0.UserInputType == Enum.UserInputType.Touch then
						L_422_ = false
						L_417_.Size = UDim2.fromOffset(L_428_:getValue().X, L_428_:getValue().Y)
					end
				end)
				L_405_.AddSignal(L_417_.TabHolder.UIListLayout:GetPropertyChangedSignal'AbsoluteContentSize', function()
					L_417_.TabHolder.CanvasSize = UDim2.new(0, 0, 0, L_417_.TabHolder.UIListLayout.AbsoluteContentSize.Y)
				end)
				L_405_.AddSignal(L_410_.InputBegan, function(L_459_arg0)
					if type(L_409_.MinimizeKeybind) == 'table' and L_409_.MinimizeKeybind.Type == 'Keybind' and not L_410_:GetFocusedTextBox() then
						if L_459_arg0.KeyCode.Name == L_409_.MinimizeKeybind.Value then
							L_417_:Minimize()
						end
					elseif L_459_arg0.KeyCode == L_409_.MinimizeKey and not L_410_:GetFocusedTextBox() then
						L_417_:Minimize()
					end
				end)
				function L_417_.Minimize(L_460_arg0)
					L_417_.Minimized = not L_417_.Minimized
					L_417_.Root.Visible = not L_417_.Minimized
					if not L_424_ then
						local L_461_ = L_409_.MinimizeKeybind and L_409_.MinimizeKeybind.Value or L_409_.MinimizeKey.Name
						L_424_ = true
						L_409_:Notify{
							Title = 'Interface',
							Content = "634346180",
							Duration = 6
						}
					end
				end
				function L_417_.Destroy(L_462_arg0)
					if L_402_(L_403_).UseAcrylic then
						L_417_.AcrylicPaint.Model:Destroy()
					end
					L_417_.Root:Destroy()
				end
				local L_434_ = L_402_(L_408_.Dialog):Init(L_417_)
				function L_417_.Dialog(L_463_arg0, L_464_arg1)
					local L_465_ = L_434_:Create()
					L_465_.Title.Text = L_464_arg1.Title
					local L_466_ = L_415_('TextLabel', {
						FontFace = Font.new'rbxasset://fonts/families/GothamSSm.json',
						Text = L_464_arg1.Content,
						TextColor3 = Color3.fromRGB(240, 240, 240),
						TextSize = 14,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top,
						Size = UDim2.new(1, -40, 1, 0),
						Position = UDim2.fromOffset(20, 60),
						BackgroundTransparency = 1,
						Parent = L_465_.Root,
						ClipsDescendants = false,
						ThemeTag = {
							TextColor3 = 'Text'
						}
					})
					L_415_('UISizeConstraint', {
						MinSize = Vector2.new(300, 165),
						MaxSize = Vector2.new(620, math.huge),
						Parent = L_465_.Root
					})
					L_465_.Root.Size = UDim2.fromOffset(L_466_.TextBounds.X + 40, 165)
					if L_466_.TextBounds.X + 40 > L_417_.Size.X.Offset - 120 then
						L_465_.Root.Size = UDim2.fromOffset(L_417_.Size.X.Offset - 120, 165)
						L_466_.TextWrapped = true
						L_465_.Root.Size = UDim2.fromOffset(L_417_.Size.X.Offset - 120, L_466_.TextBounds.Y + 150)
					end
					for L_467_forvar0, L_468_forvar1 in next, L_464_arg1.Buttons do
						L_465_:Button(L_468_forvar1.Title, L_468_forvar1.Callback)
					end
					L_465_:Open()
					if L_464_arg1.Yield then
						L_465_.Closed:Wait()
					end
					return L_465_
				end
				local L_435_ = L_402_(L_408_.Tab):Init(L_417_)
				function L_417_.Tab(L_469_arg0, L_470_arg1)
					return L_435_:New(L_470_arg1.Title, L_470_arg1.Icon, L_417_.TabHolder)
				end
				function L_417_.AddTab(L_471_arg0, L_472_arg1)
					return L_417_:Tab(L_472_arg1)
				end
				function L_417_.CreateTab(L_473_arg0, L_474_arg1)
					return L_417_:Tab(L_474_arg1)
				end
				function L_417_.SelectTab(L_475_arg0, L_476_arg1)
					L_435_:SelectTab(L_476_arg1)
				end
				L_405_.AddSignal(L_417_.TabHolder:GetPropertyChangedSignal'CanvasPosition', function()
					L_430_ = L_435_:GetCurrentTabPos() + 16
					L_431_ = 0
					L_417_.SelectorPosMotor:setGoal(L_414_(L_435_:GetCurrentTabPos()))
				end)
				return L_417_
			end
		end)()
	end,
	[18] = function()
		local L_477_, L_478_, L_479_ = L_1_(18)
		return (function(...)
			local L_480_ = L_478_.Parent
			local L_481_, L_482_, L_483_ = L_479_(L_480_.Themes), L_479_(L_480_.Packages.Flipper), {
				Registry = {},
				Signals = {},
				TransparencyMotors = {},
				DefaultProperties = {
					ScreenGui = {
						ResetOnSpawn = false,
						ZIndexBehavior = Enum.ZIndexBehavior.Sibling
					},
					Frame = {
						BackgroundColor3 = Color3.new(1, 1, 1),
						BorderColor3 = Color3.new(0, 0, 0),
						BorderSizePixel = 0
					},
					ScrollingFrame = {
						BackgroundColor3 = Color3.new(1, 1, 1),
						BorderColor3 = Color3.new(0, 0, 0),
						ScrollBarImageColor3 = Color3.new(0, 0, 0)
					},
					TextLabel = {
						BackgroundColor3 = Color3.new(1, 1, 1),
						BorderColor3 = Color3.new(0, 0, 0),
						Font = Enum.Font.SourceSans,
						Text = '',
						TextColor3 = Color3.new(0, 0, 0),
						BackgroundTransparency = 1,
						TextSize = 14
					},
					TextButton = {
						BackgroundColor3 = Color3.new(1, 1, 1),
						BorderColor3 = Color3.new(0, 0, 0),
						AutoButtonColor = false,
						Font = Enum.Font.SourceSans,
						Text = '',
						TextColor3 = Color3.new(0, 0, 0),
						TextSize = 14
					},
					TextBox = {
						BackgroundColor3 = Color3.new(1, 1, 1),
						BorderColor3 = Color3.new(0, 0, 0),
						ClearTextOnFocus = false,
						Font = Enum.Font.SourceSans,
						Text = '',
						TextColor3 = Color3.new(0, 0, 0),
						TextSize = 14
					},
					ImageLabel = {
						BackgroundTransparency = 1,
						BackgroundColor3 = Color3.new(1, 1, 1),
						BorderColor3 = Color3.new(0, 0, 0),
						BorderSizePixel = 0
					},
					ImageButton = {
						BackgroundColor3 = Color3.new(1, 1, 1),
						BorderColor3 = Color3.new(0, 0, 0),
						AutoButtonColor = false
					},
					CanvasGroup = {
						BackgroundColor3 = Color3.new(1, 1, 1),
						BorderColor3 = Color3.new(0, 0, 0),
						BorderSizePixel = 0
					}
				}
			}
			local L_484_ = function(L_485_arg0, L_486_arg1)
				if L_486_arg1.ThemeTag then
					L_483_.AddThemeObject(L_485_arg0, L_486_arg1.ThemeTag)
				end
			end
			function L_483_.AddSignal(L_487_arg0, L_488_arg1)
				L_483_.Signals[# L_483_.Signals + 1] = L_487_arg0:Connect(L_488_arg1)
			end
			function L_483_.Disconnect()
				for L_489_forvar0 = # L_483_.Signals, 1, -1 do
					local L_490_ = table.remove(L_483_.Signals, L_489_forvar0)
					L_490_:Disconnect()
				end
			end
			function L_483_.GetThemeProperty(L_491_arg0)
				if L_481_[L_479_(L_480_).Theme][L_491_arg0] then
					return L_481_[L_479_(L_480_).Theme][L_491_arg0]
				end
				return L_481_.Dark[L_491_arg0]
			end
			function L_483_.UpdateTheme()
				for L_492_forvar0, L_493_forvar1 in next, L_483_.Registry do
					for L_494_forvar0, L_495_forvar1 in next, L_493_forvar1.Properties do
						L_492_forvar0[L_494_forvar0] = L_483_.GetThemeProperty(L_495_forvar1)
					end
				end
				for L_496_forvar0, L_497_forvar1 in next, L_483_.TransparencyMotors do
					L_497_forvar1:setGoal(L_482_.Instant.new(L_483_.GetThemeProperty'ElementTransparency'))
				end
			end
			function L_483_.AddThemeObject(L_498_arg0, L_499_arg1)
				local L_500_ = # L_483_.Registry + 1
				local L_501_ = {
					Object = L_498_arg0,
					Properties = L_499_arg1,
					Idx = L_500_
				}
				L_483_.Registry[L_498_arg0] = L_501_
				L_483_.UpdateTheme()
				return L_498_arg0
			end
			function L_483_.OverrideTag(L_502_arg0, L_503_arg1)
				L_483_.Registry[L_502_arg0].Properties = L_503_arg1
				L_483_.UpdateTheme()
			end
			function L_483_.New(L_504_arg0, L_505_arg1, L_506_arg2)
				local L_507_ = Instance.new(L_504_arg0)
				for L_508_forvar0, L_509_forvar1 in next, L_483_.DefaultProperties[L_504_arg0] or {} do
					L_507_[L_508_forvar0] = L_509_forvar1
				end
				for L_510_forvar0, L_511_forvar1 in next, L_505_arg1 or {} do
					if L_510_forvar0 ~= 'ThemeTag' then
						L_507_[L_510_forvar0] = L_511_forvar1
					end
				end
				for L_512_forvar0, L_513_forvar1 in next, L_506_arg2 or {} do
					L_513_forvar1.Parent = L_507_
				end
				L_484_(L_507_, L_505_arg1)
				return L_507_
			end
			function L_483_.SpringMotor(L_514_arg0, L_515_arg1, L_516_arg2, L_517_arg3, L_518_arg4)
				L_517_arg3 = L_517_arg3 or false
				L_518_arg4 = L_518_arg4 or false
				local L_519_ = L_482_.SingleMotor.new(L_514_arg0)
				L_519_:onStep(function(L_521_arg0)
					L_515_arg1[L_516_arg2] = L_521_arg0
				end)
				if L_518_arg4 then
					table.insert(L_483_.TransparencyMotors, L_519_)
				end
				local L_520_ = function(L_522_arg0, L_523_arg1)
					L_523_arg1 = L_523_arg1 or false
					if not L_517_arg3 then
						if not L_523_arg1 then
							if L_516_arg2 == 'BackgroundTransparency' and L_479_(L_480_).DialogOpen then
								return
							end
						end
					end
					L_519_:setGoal(L_482_.Spring.new(L_522_arg0, {
						frequency = 8
					}))
				end
				return L_519_, L_520_
			end
			return L_483_
		end)()
	end,
	[19] = function()
		local L_524_, L_525_, L_526_ = L_1_(19)
		return (function(...)
			local L_527_ = {}
			for L_528_forvar0, L_529_forvar1 in next, L_525_:GetChildren() do
				L_527_[# L_527_ + 1] = L_526_(L_529_forvar1)
			end
			return L_527_
		end)()
	end,
	[20] = function()
		local L_530_, L_531_, L_532_ = L_1_(20)
		return (function(...)
			local L_533_ = L_531_.Parent.Parent
			local L_534_ = L_532_(L_533_.Creator)
			local L_535_, L_536_, L_537_ = L_534_.New, L_533_.Components, {}
			L_537_.__index = L_537_
			L_537_.__type = 'Button'
			function L_537_.New(L_538_arg0, L_539_arg1)
				assert(L_539_arg1.Title, 'Button - Missing Title')
				L_539_arg1.Callback = L_539_arg1.Callback or function()
				end
				local L_540_ = L_532_(L_536_.Element)(L_539_arg1.Title, L_539_arg1.Description, L_538_arg0.Container, true)
				L_535_('ImageLabel', {
					Image = 'rbxassetid://10709791437',
					Size = UDim2.fromOffset(16, 16),
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, -10, 0.5, 0),
					BackgroundTransparency = 1,
					Parent = L_540_.Frame,
					ThemeTag = {
						ImageColor3 = 'Text'
					}
				})
				L_534_.AddSignal(L_540_.Frame.MouseButton1Click, function()
					L_538_arg0.Library:SafeCallback(L_539_arg1.Callback)
				end)
				return L_540_
			end
			return L_537_
		end)()
	end,
	[21] = function()
		local L_541_, L_542_, L_543_ = L_1_(21)
		return (function(...)
			local L_544_, L_545_, L_546_ = game:GetService'UserInputService', game:GetService'RunService', game:GetService'Players'
			local L_547_, L_548_ = L_545_.RenderStepped, L_546_.LocalPlayer
			local L_549_, L_550_ = L_548_:GetMouse(), L_542_.Parent.Parent
			local L_551_ = L_543_(L_550_.Creator)
			local L_552_, L_553_, L_554_ = L_551_.New, L_550_.Components, {}
			L_554_.__index = L_554_
			L_554_.__type = 'Colorpicker'
			function L_554_.New(L_555_arg0, L_556_arg1, L_557_arg2)
				local L_558_ = L_555_arg0.Library
				assert(L_557_arg2.Title, 'Colorpicker - Missing Title')
				assert(L_557_arg2.Default, 'AddColorPicker: Missing default value.')
				local L_559_ = {
					Value = L_557_arg2.Default,
					Transparency = L_557_arg2.Transparency or 0,
					Type = 'Colorpicker',
					Title = type(L_557_arg2.Title) == 'string' and L_557_arg2.Title or 'Colorpicker',
					Callback = L_557_arg2.Callback or function(L_564_arg0)
					end
				}
				function L_559_.SetHSVFromRGB(L_565_arg0, L_566_arg1)
					local L_567_, L_568_, L_569_ = Color3.toHSV(L_566_arg1)
					L_559_.Hue = L_567_
					L_559_.Sat = L_568_
					L_559_.Vib = L_569_
				end
				L_559_:SetHSVFromRGB(L_559_.Value)
				local L_560_ = L_543_(L_553_.Element)(L_557_arg2.Title, L_557_arg2.Description, L_555_arg0.Container, true)
				L_559_.SetTitle = L_560_.SetTitle
				L_559_.SetDesc = L_560_.SetDesc
				local L_561_ = L_552_('Frame', {
					Size = UDim2.fromScale(1, 1),
					BackgroundColor3 = L_559_.Value,
					Parent = L_560_.Frame
				}, {
					L_552_('UICorner', {
						CornerRadius = UDim.new(0, 4)
					})
				})
				local L_562_, L_563_ = L_552_('ImageLabel', {
					Size = UDim2.fromOffset(26, 26),
					Position = UDim2.new(1, -10, 0.5, 0),
					AnchorPoint = Vector2.new(1, 0.5),
					Parent = L_560_.Frame,
					Image = 'http://www.roblox.com/asset/?id=14204231522',
					ImageTransparency = 0.45,
					ScaleType = Enum.ScaleType.Tile,
					TileSize = UDim2.fromOffset(40, 40)
				}, {
					L_552_('UICorner', {
						CornerRadius = UDim.new(0, 4)
					}),
					L_561_
				}), function()
					local L_570_ = L_543_(L_553_.Dialog):Create()
					L_570_.Title.Text = L_559_.Title
					L_570_.Root.Size = UDim2.fromOffset(430, 330)
					local L_571_, L_572_, L_573_, L_574_, L_575_, L_576_ = L_559_.Hue, L_559_.Sat, L_559_.Vib, L_559_.Transparency, function()
						local L_598_ = L_543_(L_553_.Textbox)()
						L_598_.Frame.Parent = L_570_.Root
						L_598_.Frame.Size = UDim2.new(0, 90, 0, 32)
						return L_598_
					end, function(L_599_arg0, L_600_arg1)
						return L_552_('TextLabel', {
							FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Medium, Enum.FontStyle.Normal),
							Text = L_599_arg0,
							TextColor3 = Color3.fromRGB(240, 240, 240),
							TextSize = 13,
							TextXAlignment = Enum.TextXAlignment.Left,
							Size = UDim2.new(1, 0, 0, 32),
							Position = L_600_arg1,
							BackgroundTransparency = 1,
							Parent = L_570_.Root,
							ThemeTag = {
								TextColor3 = 'Text'
							}
						})
					end
					local L_577_, L_578_ = function()
						local L_601_ = Color3.fromHSV(L_571_, L_572_, L_573_)
						return {
							R = math.floor(L_601_.r * 255),
							G = math.floor(L_601_.g * 255),
							B = math.floor(L_601_.b * 255)
						}
					end, L_552_('ImageLabel', {
						Size = UDim2.new(0, 18, 0, 18),
						ScaleType = Enum.ScaleType.Fit,
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundTransparency = 1,
						Image = 'http://www.roblox.com/asset/?id=4805639000'
					})
					local L_579_, L_580_ = L_552_('ImageLabel', {
						Size = UDim2.fromOffset(180, 160),
						Position = UDim2.fromOffset(20, 55),
						Image = 'rbxassetid://4155801252',
						BackgroundColor3 = L_559_.Value,
						BackgroundTransparency = 0,
						Parent = L_570_.Root
					}, {
						L_552_('UICorner', {
							CornerRadius = UDim.new(0, 4)
						}),
						L_578_
					}), L_552_('Frame', {
						BackgroundColor3 = L_559_.Value,
						Size = UDim2.fromScale(1, 1),
						BackgroundTransparency = L_559_.Transparency
					}, {
						L_552_('UICorner', {
							CornerRadius = UDim.new(0, 4)
						})
					})
					local L_581_, L_582_ = L_552_('ImageLabel', {
						Image = 'http://www.roblox.com/asset/?id=14204231522',
						ImageTransparency = 0.45,
						ScaleType = Enum.ScaleType.Tile,
						TileSize = UDim2.fromOffset(40, 40),
						BackgroundTransparency = 1,
						Position = UDim2.fromOffset(112, 220),
						Size = UDim2.fromOffset(88, 24),
						Parent = L_570_.Root
					}, {
						L_552_('UICorner', {
							CornerRadius = UDim.new(0, 4)
						}),
						L_552_('UIStroke', {
							Thickness = 2,
							Transparency = 0.75
						}),
						L_580_
					}), L_552_('Frame', {
						BackgroundColor3 = L_559_.Value,
						Size = UDim2.fromScale(1, 1),
						BackgroundTransparency = 0
					}, {
						L_552_('UICorner', {
							CornerRadius = UDim.new(0, 4)
						})
					})
					local L_583_, L_584_ = L_552_('ImageLabel', {
						Image = 'http://www.roblox.com/asset/?id=14204231522',
						ImageTransparency = 0.45,
						ScaleType = Enum.ScaleType.Tile,
						TileSize = UDim2.fromOffset(40, 40),
						BackgroundTransparency = 1,
						Position = UDim2.fromOffset(20, 220),
						Size = UDim2.fromOffset(88, 24),
						Parent = L_570_.Root
					}, {
						L_552_('UICorner', {
							CornerRadius = UDim.new(0, 4)
						}),
						L_552_('UIStroke', {
							Thickness = 2,
							Transparency = 0.75
						}),
						L_582_
					}), {}
					for L_602_forvar0 = 0, 1, 0.1 do
						table.insert(L_584_, ColorSequenceKeypoint.new(L_602_forvar0, Color3.fromHSV(L_602_forvar0, 1, 1)))
					end
					local L_585_, L_586_ = L_552_('UIGradient', {
						Color = ColorSequence.new(L_584_),
						Rotation = 90
					}), L_552_('Frame', {
						Size = UDim2.new(1, 0, 1, -10),
						Position = UDim2.fromOffset(0, 5),
						BackgroundTransparency = 1
					})
					local L_587_, L_588_, L_589_ = L_552_('ImageLabel', {
						Size = UDim2.fromOffset(14, 14),
						Image = 'http://www.roblox.com/asset/?id=12266946128',
						Parent = L_586_,
						ThemeTag = {
							ImageColor3 = 'DialogInput'
						}
					}), L_552_('Frame', {
						Size = UDim2.fromOffset(12, 190),
						Position = UDim2.fromOffset(210, 55),
						Parent = L_570_.Root
					}, {
						L_552_('UICorner', {
							CornerRadius = UDim.new(1, 0)
						}),
						L_585_,
						L_586_
					}), L_575_()
					L_589_.Frame.Position = UDim2.fromOffset(L_557_arg2.Transparency and 260 or 240, 55)
					L_576_('Hex', UDim2.fromOffset(L_557_arg2.Transparency and 360 or 340, 55))
					local L_590_ = L_575_()
					L_590_.Frame.Position = UDim2.fromOffset(L_557_arg2.Transparency and 260 or 240, 95)
					L_576_('Red', UDim2.fromOffset(L_557_arg2.Transparency and 360 or 340, 95))
					local L_591_ = L_575_()
					L_591_.Frame.Position = UDim2.fromOffset(L_557_arg2.Transparency and 260 or 240, 135)
					L_576_('Green', UDim2.fromOffset(L_557_arg2.Transparency and 360 or 340, 135))
					local L_592_ = L_575_()
					L_592_.Frame.Position = UDim2.fromOffset(L_557_arg2.Transparency and 260 or 240, 175)
					L_576_('Blue', UDim2.fromOffset(L_557_arg2.Transparency and 360 or 340, 175))
					local L_593_
					if L_557_arg2.Transparency then
						L_593_ = L_575_()
						L_593_.Frame.Position = UDim2.fromOffset(260, 215)
						L_576_('Alpha', UDim2.fromOffset(360, 215))
					end
					local L_594_, L_595_, L_596_
					if L_557_arg2.Transparency then
						local L_603_ = L_552_('Frame', {
							Size = UDim2.new(1, 0, 1, -10),
							Position = UDim2.fromOffset(0, 5),
							BackgroundTransparency = 1
						})
						L_595_ = L_552_('ImageLabel', {
							Size = UDim2.fromOffset(14, 14),
							Image = 'http://www.roblox.com/asset/?id=12266946128',
							Parent = L_603_,
							ThemeTag = {
								ImageColor3 = 'DialogInput'
							}
						})
						L_596_ = L_552_('Frame', {
							Size = UDim2.fromScale(1, 1)
						}, {
							L_552_('UIGradient', {
								Transparency = NumberSequence.new{
									NumberSequenceKeypoint.new(0, 0),
									NumberSequenceKeypoint.new(1, 1)
								},
								Rotation = 270
							}),
							L_552_('UICorner', {
								CornerRadius = UDim.new(1, 0)
							})
						})
						L_594_ = L_552_('Frame', {
							Size = UDim2.fromOffset(12, 190),
							Position = UDim2.fromOffset(230, 55),
							Parent = L_570_.Root,
							BackgroundTransparency = 1
						}, {
							L_552_('UICorner', {
								CornerRadius = UDim.new(1, 0)
							}),
							L_552_('ImageLabel', {
								Image = 'http://www.roblox.com/asset/?id=14204231522',
								ImageTransparency = 0.45,
								ScaleType = Enum.ScaleType.Tile,
								TileSize = UDim2.fromOffset(40, 40),
								BackgroundTransparency = 1,
								Size = UDim2.fromScale(1, 1),
								Parent = L_570_.Root
							}, {
								L_552_('UICorner', {
									CornerRadius = UDim.new(1, 0)
								})
							}),
							L_596_,
							L_603_
						})
					end
					local L_597_ = function()
						L_579_.BackgroundColor3 = Color3.fromHSV(L_571_, 1, 1)
						L_587_.Position = UDim2.new(0, -1, L_571_, -6)
						L_578_.Position = UDim2.new(L_572_, 0, 1 - L_573_, 0)
						L_582_.BackgroundColor3 = Color3.fromHSV(L_571_, L_572_, L_573_)
						L_589_.Input.Text = "-893386658"
						L_590_.Input.Text = L_577_().R
						L_591_.Input.Text = L_577_().G
						L_592_.Input.Text = L_577_().B
						if L_557_arg2.Transparency then
							L_596_.BackgroundColor3 = Color3.fromHSV(L_571_, L_572_, L_573_)
							L_582_.BackgroundTransparency = L_574_
							L_595_.Position = UDim2.new(0, -1, 1 - L_574_, -6)
							L_593_.Input.Text = "1355238750"
						end
					end
					L_551_.AddSignal(L_589_.Input.FocusLost, function(L_604_arg0)
						if L_604_arg0 then
							local L_605_, L_606_ = pcall(Color3.fromHex, L_589_.Input.Text)
							if L_605_ and typeof(L_606_) == 'Color3' then
								L_571_, L_572_, L_573_ = Color3.toHSV(L_606_)
							end
						end
						L_597_()
					end)
					L_551_.AddSignal(L_590_.Input.FocusLost, function(L_607_arg0)
						if L_607_arg0 then
							local L_608_ = L_577_()
							local L_609_, L_610_ = pcall(Color3.fromRGB, L_590_.Input.Text, L_608_.G, L_608_.B)
							if L_609_ and typeof(L_610_) == 'Color3' then
								if tonumber(L_590_.Input.Text) <= 255 then
									L_571_, L_572_, L_573_ = Color3.toHSV(L_610_)
								end
							end
						end
						L_597_()
					end)
					L_551_.AddSignal(L_591_.Input.FocusLost, function(L_611_arg0)
						if L_611_arg0 then
							local L_612_ = L_577_()
							local L_613_, L_614_ = pcall(Color3.fromRGB, L_612_.R, L_591_.Input.Text, L_612_.B)
							if L_613_ and typeof(L_614_) == 'Color3' then
								if tonumber(L_591_.Input.Text) <= 255 then
									L_571_, L_572_, L_573_ = Color3.toHSV(L_614_)
								end
							end
						end
						L_597_()
					end)
					L_551_.AddSignal(L_592_.Input.FocusLost, function(L_615_arg0)
						if L_615_arg0 then
							local L_616_ = L_577_()
							local L_617_, L_618_ = pcall(Color3.fromRGB, L_616_.R, L_616_.G, L_592_.Input.Text)
							if L_617_ and typeof(L_618_) == 'Color3' then
								if tonumber(L_592_.Input.Text) <= 255 then
									L_571_, L_572_, L_573_ = Color3.toHSV(L_618_)
								end
							end
						end
						L_597_()
					end)
					if L_557_arg2.Transparency then
						L_551_.AddSignal(L_593_.Input.FocusLost, function(L_619_arg0)
							if L_619_arg0 then
								pcall(function()
									local L_620_ = tonumber(L_593_.Input.Text)
									L_574_ = L_620_ >= 0 and L_620_ <= 100 and 1 - L_620_ * 0.01 or L_574_
								end)
							end
							L_597_()
						end)
					end
					L_551_.AddSignal(L_579_.InputBegan, function(L_621_arg0)
						if L_621_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_621_arg0.UserInputType == Enum.UserInputType.Touch then
							while L_544_:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
								local L_622_ = L_579_.AbsolutePosition.X
								local L_623_ = L_622_ + L_579_.AbsoluteSize.X
								local L_624_, L_625_ = math.clamp(L_549_.X, L_622_, L_623_), L_579_.AbsolutePosition.Y
								local L_626_ = L_625_ + L_579_.AbsoluteSize.Y
								local L_627_ = math.clamp(L_549_.Y, L_625_, L_626_)
								L_572_ = (L_624_ - L_622_) / (L_623_ - L_622_)
								L_573_ = 1 - ((L_627_ - L_625_) / (L_626_ - L_625_))
								L_597_()
								L_547_:Wait()
							end
						end
					end)
					L_551_.AddSignal(L_588_.InputBegan, function(L_628_arg0)
						if L_628_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_628_arg0.UserInputType == Enum.UserInputType.Touch then
							while L_544_:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
								local L_629_ = L_588_.AbsolutePosition.Y
								local L_630_ = L_629_ + L_588_.AbsoluteSize.Y
								local L_631_ = math.clamp(L_549_.Y, L_629_, L_630_)
								L_571_ = ((L_631_ - L_629_) / (L_630_ - L_629_))
								L_597_()
								L_547_:Wait()
							end
						end
					end)
					if L_557_arg2.Transparency then
						L_551_.AddSignal(L_594_.InputBegan, function(L_632_arg0)
							if L_632_arg0.UserInputType == Enum.UserInputType.MouseButton1 then
								while L_544_:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
									local L_633_ = L_594_.AbsolutePosition.Y
									local L_634_ = L_633_ + L_594_.AbsoluteSize.Y
									local L_635_ = math.clamp(L_549_.Y, L_633_, L_634_)
									L_574_ = 1 - ((L_635_ - L_633_) / (L_634_ - L_633_))
									L_597_()
									L_547_:Wait()
								end
							end
						end)
					end
					L_597_()
					L_570_:Button('Done', function()
						L_559_:SetValue({
							L_571_,
							L_572_,
							L_573_
						}, L_574_)
					end)
					L_570_:Button'Cancel'
					L_570_:Open()
				end
				function L_559_.Display(L_636_arg0)
					L_559_.Value = Color3.fromHSV(L_559_.Hue, L_559_.Sat, L_559_.Vib)
					L_561_.BackgroundColor3 = L_559_.Value
					L_561_.BackgroundTransparency = L_559_.Transparency
					L_554_.Library:SafeCallback(L_559_.Callback, L_559_.Value)
					L_554_.Library:SafeCallback(L_559_.Changed, L_559_.Value)
				end
				function L_559_.SetValue(L_637_arg0, L_638_arg1, L_639_arg2)
					local L_640_ = Color3.fromHSV(L_638_arg1[1], L_638_arg1[2], L_638_arg1[3])
					L_559_.Transparency = L_639_arg2 or 0
					L_559_:SetHSVFromRGB(L_640_)
					L_559_:Display()
				end
				function L_559_.SetValueRGB(L_641_arg0, L_642_arg1, L_643_arg2)
					L_559_.Transparency = L_643_arg2 or 0
					L_559_:SetHSVFromRGB(L_642_arg1)
					L_559_:Display()
				end
				function L_559_.OnChanged(L_644_arg0, L_645_arg1)
					L_559_.Changed = L_645_arg1
					L_558_:SafeCallback(L_645_arg1, L_559_.Value, L_559_.Value)
				end
				function L_559_.Destroy(L_646_arg0)
					L_560_:Destroy()
					L_558_.Options[L_556_arg1] = nil
				end
				L_551_.AddSignal(L_560_.Frame.MouseButton1Click, function()
					L_563_()
				end)
				L_559_:Display()
				L_558_.Options[L_556_arg1] = L_559_
				return setmetatable(L_559_, {
					__newindex = function(L_647_arg0, L_648_arg1, L_649_arg2)
						local L_650_ = typeof(L_649_arg2)
						if L_648_arg1 == 'Value' then
							return L_559_[L_650_ == 'table' and 'SetValue' or 'SetValueRGB'](L_559_, L_649_arg2)
						elseif L_648_arg1 == 'Transparency' and L_650_ == 'number' then
							return L_559_:SetValueRGB(L_559_.Value, L_649_arg2)
						end
						return rawset(L_647_arg0, L_648_arg1, L_649_arg2)
					end
				})
			end
			return L_554_
		end)()
	end,
	[22] = function()
		local L_651_, L_652_, L_653_ = L_1_(22)
		return (function(...)
			local L_654_, L_655_, L_656_, L_657_ = game:GetService'UserInputService', game:GetService'Players'.LocalPlayer:GetMouse(), game:GetService'Workspace'.CurrentCamera, L_652_.Parent.Parent
			local L_658_, L_659_ = L_653_(L_657_.Creator), L_653_(L_657_.Packages.Flipper)
			local L_660_, L_661_, L_662_ = L_658_.New, L_657_.Components, {}
			L_662_.__index = L_662_
			L_662_.__type = 'Dropdown'
			function L_662_.New(L_663_arg0, L_664_arg1, L_665_arg2)
				local L_666_ = L_663_arg0.Library
				local L_667_, L_668_ = {
					Values = (function()
						local L_685_ = {}
						for L_686_forvar0, L_687_forvar1 in next, L_665_arg2.Values or {} do
							L_685_[# L_685_ + 1] = L_687_forvar1
						end
						return L_685_
					end)(),
					Value = L_665_arg2.Default,
					Multi = L_665_arg2.Multi or false,
					Displayer = L_665_arg2.Displayer or function(L_688_arg0)
						return typeof(L_688_arg0) ~= 'number' and tostring(L_666_.Utilities:Prettify(L_688_arg0)) or L_688_arg0
					end,
					Buttons = {},
					Opened = false,
					Type = 'Dropdown',
					Callback = L_665_arg2.Callback or function()
					end,
					Changed = L_665_arg2.Changed or function()
					end
				}, L_653_(L_661_.Element)(L_665_arg2.Title, L_665_arg2.Description, L_663_arg0.Container, false)
				L_668_.DescLabel.Size = UDim2.new(1, -170, 0, 14)
				L_667_.SetTitle = L_668_.SetTitle
				L_667_.SetDesc = L_668_.SetDesc
				local L_669_, L_670_ = L_660_('TextLabel', {
					FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal),
					Text = 'Value',
					TextColor3 = Color3.fromRGB(240, 240, 240),
					TextSize = 13,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, -30, 0, 14),
					Position = UDim2.new(0, 8, 0.5, 0),
					AnchorPoint = Vector2.new(0, 0.5),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					TextTruncate = Enum.TextTruncate.AtEnd,
					ThemeTag = {
						TextColor3 = 'Text'
					}
				}), L_660_('ImageLabel', {
					Image = 'rbxassetid://10709790948',
					Size = UDim2.fromOffset(16, 16),
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, -8, 0.5, 0),
					BackgroundTransparency = 1,
					ThemeTag = {
						ImageColor3 = 'SubText'
					}
				})
				local L_671_, L_672_ = L_660_('TextButton', {
					Size = UDim2.fromOffset(160, 30),
					Position = UDim2.new(1, -10, 0.5, 0),
					AnchorPoint = Vector2.new(1, 0.5),
					BackgroundTransparency = 0.9,
					Parent = L_668_.Frame,
					ThemeTag = {
						BackgroundColor3 = 'DropdownFrame'
					}
				}, {
					L_660_('UICorner', {
						CornerRadius = UDim.new(0, 5)
					}),
					L_660_('UIStroke', {
						Transparency = 0.5,
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
						ThemeTag = {
							Color = 'InElementBorder'
						}
					}),
					L_670_,
					L_669_
				}), L_660_('UIListLayout', {
					Padding = UDim.new(0, 3)
				})
				local L_673_ = L_660_('ScrollingFrame', {
					Size = UDim2.new(1, -5, 1, -10),
					Position = UDim2.fromOffset(5, 5),
					BackgroundTransparency = 1,
					BottomImage = 'rbxassetid://6889812791',
					MidImage = 'rbxassetid://6889812721',
					TopImage = 'rbxassetid://6276641225',
					ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
					ScrollBarImageTransparency = 0.95,
					ScrollBarThickness = 4,
					BorderSizePixel = 0,
					CanvasSize = UDim2.fromScale(0, 0)
				}, {
					L_672_
				})
				local L_674_, L_675_, L_676_ = L_660_('Frame', {
					Size = UDim2.fromScale(1, 0.6),
					ThemeTag = {
						BackgroundColor3 = 'DropdownHolder'
					}
				}, {
					L_673_,
					L_660_('UICorner', {
						CornerRadius = UDim.new(0, 7)
					}),
					L_660_('UIStroke', {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
						ThemeTag = {
							Color = 'DropdownBorder'
						}
					}),
					L_660_('ImageLabel', {
						BackgroundTransparency = 1,
						Image = 'http://www.roblox.com/asset/?id=5554236805',
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(23, 23, 277, 277),
						Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(30, 30),
						Position = UDim2.fromOffset(-15, -15),
						ImageColor3 = Color3.fromRGB(0, 0, 0),
						ImageTransparency = 0.1
					})
				}), L_660_('Frame', {
					Size = UDim2.fromOffset(4, 14),
					BackgroundColor3 = Color3.fromRGB(76, 194, 255),
					Position = UDim2.fromOffset(-1, 16),
					AnchorPoint = Vector2.new(0, 0.5),
					ThemeTag = {
						BackgroundColor3 = 'Accent'
					}
				}, {
					L_660_('UICorner', {
						CornerRadius = UDim.new(0, 2)
					})
				}), L_660_('TextLabel', {
					FontFace = Font.new'rbxasset://fonts/families/GothamSSm.json',
					TextColor3 = Color3.fromRGB(200, 200, 200),
					TextSize = 13,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.fromOffset(10, 0),
					Name = 'ButtonLabel',
					ThemeTag = {
						TextColor3 = 'Text'
					}
				})
				local L_677_, L_678_ = L_660_('TextButton', {
					Size = UDim2.new(1, -5, 0, 32),
					BackgroundTransparency = 1,
					ZIndex = 23,
					Text = '',
					ThemeTag = {
						BackgroundColor3 = 'DropdownOption'
					}
				}, {
					L_675_,
					L_676_,
					L_660_('UICorner', {
						CornerRadius = UDim.new(0, 6)
					})
				}), L_660_('Frame', {
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(170, 300),
					Parent = L_663_arg0.Library.GUI,
					Visible = false
				}, {
					L_674_,
					L_660_('UISizeConstraint', {
						MinSize = Vector2.new(170, 0)
					})
				})
				table.insert(L_666_.OpenFrames, L_678_)
				local L_679_, L_680_ = function()
					local L_689_ = 0
					if L_656_.ViewportSize.Y - L_671_.AbsolutePosition.Y < L_678_.AbsoluteSize.Y - 5 then
						L_689_ = L_678_.AbsoluteSize.Y - 5 - (L_656_.ViewportSize.Y - L_671_.AbsolutePosition.Y) + 40
					end
					L_678_.Position = UDim2.fromOffset(L_671_.AbsolutePosition.X - 1, L_671_.AbsolutePosition.Y - 5 - L_689_)
				end, 0
				local L_681_, L_682_ = function()
					if # L_667_.Values > 10 then
						L_678_.Size = UDim2.fromOffset(L_680_, 392)
					else
						L_678_.Size = UDim2.fromOffset(L_680_, L_672_.AbsoluteContentSize.Y + 10)
					end
				end, function()
					L_673_.CanvasSize = UDim2.fromOffset(0, L_672_.AbsoluteContentSize.Y)
				end
				L_679_()
				L_681_()
				L_658_.AddSignal(L_671_:GetPropertyChangedSignal'AbsolutePosition', L_679_)
				L_658_.AddSignal(L_671_.MouseButton1Click, function()
					L_667_:Open()
				end)
				L_658_.AddSignal(L_654_.InputBegan, function(L_690_arg0)
					if L_690_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_690_arg0.UserInputType == Enum.UserInputType.Touch then
						local L_691_, L_692_ = L_674_.AbsolutePosition, L_674_.AbsoluteSize
						if L_655_.X < L_691_.X or L_655_.X > L_691_.X + L_692_.X or L_655_.Y < (L_691_.Y - 20 - 1) or L_655_.Y > L_691_.Y + L_692_.Y then
							L_667_:Close()
						end
					end
				end)
				local L_683_ = L_663_arg0.ScrollFrame
				function L_667_.Open(L_693_arg0)
					L_667_.Opened = true
					L_683_.ScrollingEnabled = false
					L_678_.Visible = true
					L_674_:TweenSize(UDim2.fromScale(1, 1), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.2)
				end
				function L_667_.Close(L_694_arg0)
					L_667_.Opened = false
					L_683_.ScrollingEnabled = true
					L_674_.Size = UDim2.fromScale(1, 0.6)
					L_678_.Visible = false
				end
				function L_667_.Display(L_695_arg0)
					local L_696_, L_697_ = L_667_.Values, ''
					if L_665_arg2.Multi then
						for L_698_forvar0, L_699_forvar1 in next, L_696_ do
							if L_667_.Value[L_699_forvar1] then
								L_697_ = "1663302788"
							end
						end
						L_697_ = L_697_:sub(1, # L_697_ - 2)
					else
						L_697_ = L_667_.Value and L_667_.Displayer(L_667_.Value) or ''
					end
					L_669_.Text = (L_697_ == '' and '--' or L_697_)
				end
				function L_667_.GetActiveValues(L_700_arg0)
					if L_665_arg2.Multi then
						local L_701_ = {}
						for L_702_forvar0, L_703_forvar1 in next, L_667_.Value do
							L_701_[# L_701_ + 1] = L_702_forvar0
						end
						return L_701_
					else
						return L_667_.Value and 1 or 0
					end
				end
				function L_667_.BuildDropdownList(L_704_arg0)
					local L_705_, L_706_ = L_667_.Values, {}
					for L_708_forvar0, L_709_forvar1 in next, L_673_:GetChildren() do
						if not L_709_forvar1:IsA'UIListLayout' then
							L_709_forvar1:Destroy()
						end
					end
					local L_707_ = 0
					for L_710_forvar0, L_711_forvar1 in next, L_705_ do
						local L_712_, L_713_ = {}
						L_707_ = L_707_ + 1
						local L_714_ = L_677_:Clone()
						local L_715_, L_716_ = L_714_.Frame, L_714_.ButtonLabel
						L_658_.AddThemeObject(L_714_, {
							BackgroundColor3 = 'DropdownOption'
						})
						L_658_.AddThemeObject(L_715_, {
							BackgroundColor3 = 'Accent'
						})
						L_658_.AddThemeObject(L_716_, {
							TextColor3 = 'Text'
						})
						if L_665_arg2.Multi then
							L_713_ = L_667_.Value[L_711_forvar1]
						else
							L_713_ = L_667_.Value == L_711_forvar1
						end
						local L_717_, L_718_ = L_658_.SpringMotor(1, L_714_, 'BackgroundTransparency')
						local L_719_, L_720_ = L_658_.SpringMotor(1, L_715_, 'BackgroundTransparency')
						local L_721_ = L_659_.SingleMotor.new(6)
						L_721_:onStep(function(L_722_arg0)
							L_715_.Size = UDim2.new(0, 4, 0, L_722_arg0)
						end)
						L_658_.AddSignal(L_714_.MouseEnter, function()
							L_718_(L_713_ and 0.85 or 0.89)
						end)
						L_658_.AddSignal(L_714_.MouseLeave, function()
							L_718_(L_713_ and 0.89 or 1)
						end)
						L_658_.AddSignal(L_714_.MouseButton1Down, function()
							L_718_(0.92)
						end)
						L_658_.AddSignal(L_714_.MouseButton1Up, function()
							L_718_(L_713_ and 0.85 or 0.89)
						end)
						function L_712_.UpdateButton(L_723_arg0)
							if L_665_arg2.Multi then
								L_713_ = L_667_.Value[L_711_forvar1]
								if L_713_ then
									L_718_(0.89)
								end
							else
								L_713_ = L_667_.Value == L_711_forvar1
								L_718_(L_713_ and 0.89 or 1)
							end
							L_721_:setGoal(L_659_.Spring.new(L_713_ and 14 or 6, {
								frequency = 6
							}))
							L_720_(L_713_ and 0 or 1)
						end
						L_716_.InputBegan:Connect(function(L_724_arg0)
							if L_724_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_724_arg0.UserInputType == Enum.UserInputType.Touch then
								local L_725_ = not L_713_
								if L_667_:GetActiveValues() == 1 and not L_725_ and not L_665_arg2.AllowNull then
								else
									if L_665_arg2.Multi then
										L_713_ = L_725_
										L_667_.Value[L_711_forvar1] = L_713_ and true or nil
									else
										L_713_ = L_725_
										L_667_.Value = L_713_ and L_711_forvar1 or nil
										for L_726_forvar0, L_727_forvar1 in next, L_706_ do
											L_727_forvar1:UpdateButton()
										end
									end
									L_712_:UpdateButton()
									L_667_:Display()
									L_666_:SafeCallback(L_667_.Callback, L_667_.Value)
									L_666_:SafeCallback(L_667_.Changed, L_667_.Value)
								end
							end
						end)
						L_716_.Text = L_667_.Displayer(L_711_forvar1)
						L_714_.Parent = L_673_
						L_712_:UpdateButton()
						L_667_:Display()
						L_706_[L_714_] = L_712_
						if L_707_ % 30 == 0 then
							task.wait()
						end
					end
					L_680_ = 0
					for L_728_forvar0, L_729_forvar1 in next, L_706_ do
						if L_728_forvar0.ButtonLabel then
							if L_728_forvar0.ButtonLabel.TextBounds.X > L_680_ then
								L_680_ = L_728_forvar0.ButtonLabel.TextBounds.X
							end
						end
					end
					L_680_ = L_680_ + 30
					L_682_()
					L_681_()
				end
				function L_667_.SetValues(L_730_arg0, L_731_arg1)
					if L_731_arg1 then
						L_667_.Values = L_731_arg1
					end
					L_667_:BuildDropdownList()
				end
				function L_667_.OnChanged(L_732_arg0, L_733_arg1)
					L_667_.Changed = L_733_arg1
					L_666_:SafeCallback(L_733_arg1, L_667_.Value, L_667_.Value)
				end
				function L_667_.SetValue(L_734_arg0, L_735_arg1)
					if L_667_.Multi then
						local L_736_ = {}
						for L_737_forvar0, L_738_forvar1 in next, L_735_arg1 do
							if table.find(L_667_.Values, L_737_forvar0) then
								L_736_[L_737_forvar0] = true
							end
						end
						L_667_.Value = L_736_
					else
						if not L_735_arg1 then
							L_667_.Value = nil
						elseif table.find(L_667_.Values, L_735_arg1) then
							L_667_.Value = L_735_arg1
						end
					end
					L_667_:BuildDropdownList()
					L_666_:SafeCallback(L_667_.Callback, L_667_.Value)
					L_666_:SafeCallback(L_667_.Changed, L_667_.Value)
				end
				function L_667_.Destroy(L_739_arg0)
					L_668_:Destroy()
					L_666_.Options[L_664_arg1] = nil
				end
				L_667_:BuildDropdownList()
				L_667_:Display()
				local L_684_ = {}
				if type(L_665_arg2.Default) == 'table' then
					for L_740_forvar0, L_741_forvar1 in next, L_665_arg2.Default do
						local L_742_ = table.find(L_667_.Values, L_741_forvar1)
						if L_742_ then
							table.insert(L_684_, L_742_)
						end
					end
					table.clear(L_665_arg2.Default)
				elseif type(L_665_arg2.Default) == 'number' and L_667_.Values[L_665_arg2.Default] ~= nil then
					table.insert(L_684_, L_665_arg2.Default)
				else
					local L_743_ = table.find(L_667_.Values, L_665_arg2.Default)
					if L_743_ then
						table.insert(L_684_, L_743_)
					end
				end
				if next(L_684_) then
					for L_744_forvar0 = 1, # L_684_ do
						local L_745_ = L_684_[L_744_forvar0]
						if L_665_arg2.Multi then
							L_667_.Value[L_667_.Values[L_745_] ] = true
						else
							L_667_.Value = L_667_.Values[L_745_]
							break
						end
					end
					L_667_:BuildDropdownList()
					L_667_:Display()
				end
				L_666_.Options[L_664_arg1] = L_667_
				return setmetatable(L_667_, {
					__newindex = function(L_746_arg0, L_747_arg1, L_748_arg2)
						if L_747_arg1 == 'Value' then
							L_667_:SetValue(L_748_arg2)
						elseif L_747_arg1 == 'Values' or L_747_arg1 == 'List' then
							L_667_:SetValues(L_748_arg2)
						end
						return rawset(L_746_arg0, L_747_arg1, L_748_arg2)
					end
				})
			end
			return L_662_
		end)()
	end,
	[23] = function()
		local L_749_, L_750_, L_751_ = L_1_(23)
		return (function(...)
			local L_752_ = L_750_.Parent.Parent
			local L_753_ = L_751_(L_752_.Creator)
			local L_754_, L_755_, L_756_ = L_753_.AddSignal, L_752_.Components, {}
			L_756_.__index = L_756_
			L_756_.__type = 'Input'
			function L_756_.New(L_757_arg0, L_758_arg1, L_759_arg2)
				local L_760_ = L_757_arg0.Library
				assert(L_759_arg2.Title, 'Input - Missing Title')
				L_759_arg2.Callback = L_759_arg2.Callback or function()
				end
				local L_761_, L_762_ = {
					Value = L_759_arg2.Default or '',
					Numeric = L_759_arg2.Numeric or false,
					Finished = L_759_arg2.Finished or false,
					Callback = L_759_arg2.Callback or function(L_765_arg0)
					end,
					Type = 'Input'
				}, L_751_(L_755_.Element)(L_759_arg2.Title, L_759_arg2.Description, L_757_arg0.Container, false)
				L_761_.SetTitle = L_762_.SetTitle
				L_761_.SetDesc = L_762_.SetDesc
				local L_763_ = L_751_(L_755_.Textbox)(L_762_.Frame, true)
				L_763_.Frame.Position = UDim2.new(1, -10, 0.5, 0)
				L_763_.Frame.AnchorPoint = Vector2.new(1, 0.5)
				L_763_.Frame.Size = UDim2.fromOffset(160, 30)
				L_763_.Input.Text = L_759_arg2.Default or ''
				L_763_.Input.PlaceholderText = L_759_arg2.Placeholder or ''
				local L_764_ = L_763_.Input
				function L_761_.SetValue(L_766_arg0, L_767_arg1)
					if L_759_arg2.MaxLength and # L_767_arg1 > L_759_arg2.MaxLength then
						L_767_arg1 = L_767_arg1:sub(1, L_759_arg2.MaxLength)
					end
					if L_761_.Numeric then
						if (not tonumber(L_767_arg1)) and L_767_arg1:len() > 0 then
							L_767_arg1 = L_761_.Value
						end
					end
					L_761_.Value = L_767_arg1
					L_764_.Text = L_767_arg1
					L_760_:SafeCallback(L_761_.Callback, L_761_.Value)
					L_760_:SafeCallback(L_761_.Changed, L_761_.Value)
				end
				if L_761_.Finished then
					L_754_(L_764_.FocusLost, function(L_768_arg0)
						if not L_768_arg0 then
							return
						end
						L_761_:SetValue(L_764_.Text)
					end)
				else
					L_754_(L_764_:GetPropertyChangedSignal'Text', function()
						L_761_:SetValue(L_764_.Text)
					end)
				end
				function L_761_.OnChanged(L_769_arg0, L_770_arg1)
					L_761_.Changed = L_770_arg1
					L_760_:SafeCallback(L_770_arg1, L_761_.Value, L_761_.Value)
				end
				function L_761_.Destroy(L_771_arg0)
					L_762_:Destroy()
					L_760_.Options[L_758_arg1] = nil
				end
				L_760_.Options[L_758_arg1] = L_761_
				return setmetatable(L_761_, {
					__newindex = function(L_772_arg0, L_773_arg1, L_774_arg2)
						if L_773_arg1 == 'Value' then
							L_761_:SetValue(L_774_arg2)
						end
						return rawset(L_772_arg0, L_773_arg1, L_774_arg2)
					end
				})
			end
			return L_756_
		end)()
	end,
	[24] = function()
		local L_775_, L_776_, L_777_ = L_1_(24)
		return (function(...)
			local L_778_, L_779_ = game:GetService'UserInputService', L_776_.Parent.Parent
			local L_780_ = L_777_(L_779_.Creator)
			local L_781_, L_782_, L_783_ = L_780_.New, L_779_.Components, {}
			L_783_.__index = L_783_
			L_783_.__type = 'Keybind'
			function L_783_.New(L_784_arg0, L_785_arg1, L_786_arg2)
				local L_787_, L_788_, L_789_, L_790_ = L_784_arg0.Library, {
					Value = L_786_arg2.Default or L_786_arg2.Value or Enum.KeyCode.Unknown,
					Toggled = false,
					Mode = L_786_arg2.Mode or 'Toggle',
					Type = 'Keybind',
					Callback = L_786_arg2.Callback or function(L_793_arg0)
					end,
					ChangedCallback = L_786_arg2.ChangedCallback or function(L_794_arg0)
					end
				}, false, L_777_(L_782_.Element)(L_786_arg2.Title or 'Keybind', L_786_arg2.Description, L_784_arg0.Container, true)
				L_788_.SetTitle = L_790_.SetTitle
				L_788_.SetDesc = L_790_.SetDesc
				local L_791_ = L_781_('TextLabel', {
					FontFace = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal),
					Text = L_787_.Utilities:Prettify(L_788_.Value),
					TextColor3 = Color3.fromRGB(240, 240, 240),
					TextSize = 13,
					TextXAlignment = Enum.TextXAlignment.Center,
					Size = UDim2.new(0, 0, 0, 14),
					Position = UDim2.new(0, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0, 0.5),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundTransparency = 1,
					ThemeTag = {
						TextColor3 = 'Text'
					}
				})
				local L_792_ = L_781_('TextButton', {
					Size = UDim2.fromOffset(0, 30),
					Position = UDim2.new(1, -10, 0.5, 0),
					AnchorPoint = Vector2.new(1, 0.5),
					BackgroundTransparency = 0.9,
					Parent = L_790_.Frame,
					AutomaticSize = Enum.AutomaticSize.X,
					ThemeTag = {
						BackgroundColor3 = 'Keybind'
					}
				}, {
					L_781_('UICorner', {
						CornerRadius = UDim.new(0, 5)
					}),
					L_781_('UIPadding', {
						PaddingLeft = UDim.new(0, 8),
						PaddingRight = UDim.new(0, 8)
					}),
					L_781_('UIStroke', {
						Transparency = 0.5,
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
						ThemeTag = {
							Color = 'InElementBorder'
						}
					}),
					L_791_
				})
				function L_788_.GetState(L_795_arg0)
					if L_778_:GetFocusedTextBox() and L_788_.Mode ~= 'Always' then
						return false
					end
					if L_788_.Mode == 'Always' then
						return true
					elseif L_788_.Mode == 'Hold' then
						if L_788_.Value == 'None' then
							return false
						end
						local L_796_ = L_788_.Value
						if L_796_ == 'LeftMousebutton' or L_796_ == 'RightMousebutton' then
							return L_796_ == 'LeftMousebutton' and L_778_:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or L_796_ == 'RightMousebutton' and L_778_:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
						else
							return L_778_:IsKeyDown(Enum.KeyCode[L_788_.Value])
						end
					else
						return L_788_.Toggled
					end
				end
				function L_788_.SetValue(L_797_arg0, L_798_arg1, L_799_arg2)
					L_798_arg1 = L_798_arg1 or L_788_.Key
					L_799_arg2 = L_799_arg2 or L_788_.Mode
					L_788_.Value = L_798_arg1
					L_788_.Mode = L_799_arg2
					L_791_.Text = L_787_.Utilities:Prettify(L_788_.Value)
				end
				function L_788_.OnClick(L_800_arg0, L_801_arg1)
					L_788_.Clicked = L_801_arg1
				end
				function L_788_.OnChanged(L_802_arg0, L_803_arg1)
					L_788_.Changed = L_803_arg1
					L_787_:SafeCallback(L_803_arg1, L_788_.Value, L_788_.Value)
				end
				function L_788_.DoClick(L_804_arg0)
					L_787_:SafeCallback(L_788_.Callback, L_788_.Toggled)
					L_787_:SafeCallback(L_788_.Clicked, L_788_.Toggled)
				end
				function L_788_.Destroy(L_805_arg0)
					L_790_:Destroy()
					L_787_.Options[L_785_arg1] = nil
				end
				L_780_.AddSignal(L_792_.InputBegan, function(L_806_arg0)
					if L_806_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_806_arg0.UserInputType == Enum.UserInputType.Touch then
						L_789_ = true
						L_791_.Text = '...'
						wait(0.2)
						L_778_.InputBegan:Once(function(L_807_arg0)
							local L_808_
							if L_807_arg0.UserInputType == Enum.UserInputType.Keyboard then
								L_808_ = L_807_arg0.KeyCode.Name
							elseif L_807_arg0.UserInputType == Enum.UserInputType.MouseButton1 then
								L_808_ = 'LeftMousebutton'
							elseif L_807_arg0.UserInputType == Enum.UserInputType.MouseButton2 then
								L_808_ = 'RightMousebutton'
							end
							L_778_.InputEnded:Once(function(L_809_arg0)
								if (L_809_arg0.KeyCode.Name == L_808_ or L_808_ == 'LeftMousebutton' and L_809_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_808_ == 'RightMousebutton' and L_809_arg0.UserInputType == Enum.UserInputType.MouseButton2) and not L_787_.Unloaded then
									L_789_ = false
									L_788_.Value = L_808_
									L_791_.Text = L_787_.Utilities:Prettify(L_788_.Value)
									L_787_:SafeCallback(L_788_.ChangedCallback, L_809_arg0.KeyCode or L_809_arg0.UserInputType)
									L_787_:SafeCallback(L_788_.Changed, L_809_arg0.KeyCode or L_809_arg0.UserInputType)
								end
							end)
						end)
					end
				end)
				L_780_.AddSignal(L_778_.InputBegan, function(L_810_arg0)
					if not L_789_ and not L_778_:GetFocusedTextBox() then
						if L_788_.Mode == 'Toggle' then
							local L_811_ = L_788_.Value
							if L_811_ == 'LeftMousebutton' or L_811_ == 'RightMousebutton' then
								if L_811_ == 'LeftMousebutton' and L_810_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_811_ == 'RightMousebutton' and L_810_arg0.UserInputType == Enum.UserInputType.MouseButton2 then
									L_788_.Toggled = not L_788_.Toggled
									L_788_:DoClick()
								end
							elseif L_810_arg0.UserInputType == Enum.UserInputType.Keyboard then
								if L_810_arg0.KeyCode.Name == L_811_ then
									L_788_.Toggled = not L_788_.Toggled
									L_788_:DoClick()
								end
							end
						end
					end
				end)
				L_787_.Options[L_785_arg1] = L_788_
				return setmetatable(L_788_, {
					__newindex = function(L_812_arg0, L_813_arg1, L_814_arg2)
						if L_813_arg1 == 'Value' then
							L_788_:SetValue(L_814_arg2)
						end
						return rawset(L_812_arg0, L_813_arg1, L_814_arg2)
					end
				})
			end
			return L_783_
		end)()
	end,
	[25] = function()
		local L_815_, L_816_, L_817_ = L_1_(25)
		return (function(...)
			local L_818_ = L_816_.Parent.Parent
			local L_819_, L_820_, L_821_ = L_818_.Components, L_817_(L_818_.Creator), {}
			L_821_.__index = L_821_
			L_821_.__type = 'Paragraph'
			function L_821_.New(L_822_arg0, L_823_arg1, L_824_arg2)
				local L_825_ = L_822_arg0.Library
				assert(L_824_arg2.Title, 'Paragraph - Missing Title')
				L_824_arg2.Content = L_824_arg2.Content or ''
				local L_826_ = {
					Value = L_824_arg2.Content,
					Callback = L_824_arg2.Callback or function(L_828_arg0)
					end,
					Type = 'Paragraph'
				}
				local L_827_ = L_817_(L_819_.Element)(L_824_arg2.Title, L_826_.Value, L_822_arg0.Container, false, {
					TitleAlignment = L_824_arg2.TitleAlignment == 'Middle' and 'Center' or L_824_arg2.TitleAlignment,
					DescriptionAlignment = L_824_arg2.ContentAlignment == 'Middle' and 'Center' or L_824_arg2.ContentAlignment
				})
				L_827_.Frame.BackgroundTransparency = 0.92
				L_827_.Border.Transparency = 0.6
				function L_826_.OnChanged(L_829_arg0, L_830_arg1)
					L_826_.Changed = L_830_arg1
					L_825_:SafeCallback(L_830_arg1, L_826_.Value, L_826_.Value)
				end
				function L_826_.SetValue(L_831_arg0, L_832_arg1)
					L_832_arg1 = L_832_arg1 or ''
					L_826_.Value = L_832_arg1
					L_827_:SetDesc(L_832_arg1)
					L_827_.Frame.BackgroundTransparency = 0.92
					L_827_.Border.Transparency = 0.6
					L_825_:SafeCallback(L_826_.Callback, L_826_.Value)
					L_825_:SafeCallback(L_826_.Changed, L_826_.Value)
				end
				function L_826_.Destroy(L_833_arg0)
					L_827_:Destroy()
					L_825_.Options[L_823_arg1] = nil
				end
				L_826_:SetValue(L_826_.Value)
				L_825_.Options[L_823_arg1] = L_826_
				return setmetatable(L_826_, {
					__newindex = function(L_834_arg0, L_835_arg1, L_836_arg2)
						if L_835_arg1 == 'Value' then
							return L_826_:SetValue(L_836_arg2)
						end
						return rawset(L_834_arg0, L_835_arg1, L_836_arg2)
					end
				})
			end
			return L_821_
		end)()
	end,
	[26] = function()
		local L_837_, L_838_, L_839_ = L_1_(26)
		return (function(...)
			local L_840_, L_841_ = game:GetService'UserInputService', L_838_.Parent.Parent
			local L_842_ = L_839_(L_841_.Creator)
			local L_843_, L_844_, L_845_ = L_842_.New, L_841_.Components, {}
			L_845_.__index = L_845_
			L_845_.__type = 'Slider'
			function L_845_.New(L_846_arg0, L_847_arg1, L_848_arg2)
				local L_849_ = L_846_arg0.Library
				assert(L_848_arg2.Max, 'Slider - Missing maximum value.')
				local L_850_, L_851_, L_852_ = {
					Value = nil,
					Min = typeof(L_848_arg2.Min) == 'number' and L_848_arg2.Min or 0,
					Max = L_848_arg2.Max,
					Rounding = typeof(L_848_arg2.Rounding) == 'number' and L_848_arg2.Rounding or 0,
					Callback = typeof(L_848_arg2.Min) == 'function' and L_848_arg2.Callback or function(L_857_arg0, L_858_arg1)
					end,
					Changed = L_848_arg2.Changed or function()
					end,
					Type = 'Slider'
				}, false, L_839_(L_844_.Element)(L_848_arg2.Title or 'Slider', L_848_arg2.Description, L_846_arg0.Container, false)
				L_852_.DescLabel.Size = UDim2.new(1, -170, 0, 14)
				L_850_.SetTitle = L_852_.SetTitle
				L_850_.SetDesc = L_852_.SetDesc
				local L_853_ = L_843_('ImageLabel', {
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.new(0, -7, 0.5, 0),
					Size = UDim2.fromOffset(14, 14),
					Image = 'http://www.roblox.com/asset/?id=12266946128',
					ThemeTag = {
						ImageColor3 = 'Accent'
					}
				})
				local L_854_, L_855_, L_856_ = L_843_('Frame', {
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(7, 0),
					Size = UDim2.new(1, -14, 1, 0)
				}, {
					L_853_
				}), L_843_('Frame', {
					Size = UDim2.new(0, 0, 1, 0),
					ThemeTag = {
						BackgroundColor3 = 'Accent'
					}
				}, {
					L_843_('UICorner', {
						CornerRadius = UDim.new(1, 0)
					})
				}), L_843_('TextBox', {
					FontFace = Font.new'rbxasset://fonts/families/GothamSSm.json',
					Text = 'Value',
					ClearTextOnFocus = true,
					TextSize = 12,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Right,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 100, 0, 14),
					Position = UDim2.new(0, -4, 0.5, 0),
					AnchorPoint = Vector2.new(1, 0.5),
					ThemeTag = {
						TextColor3 = 'SubText'
					}
				})
				L_843_('Frame', {
					Size = UDim2.new(1, 0, 0, 4),
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, -10, 0.5, 0),
					BackgroundTransparency = 0.4,
					Parent = L_852_.Frame,
					ThemeTag = {
						BackgroundColor3 = 'SliderRail'
					}
				}, {
					L_843_('UICorner', {
						CornerRadius = UDim.new(1, 0)
					}),
					L_843_('UISizeConstraint', {
						MaxSize = Vector2.new(150, math.huge)
					}),
					L_856_,
					L_855_,
					L_854_
				})
				L_842_.AddSignal(L_853_.InputBegan, function(L_859_arg0)
					if L_859_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_859_arg0.UserInputType == Enum.UserInputType.Touch then
						L_851_ = true
					end
				end)
				L_842_.AddSignal(L_853_.InputEnded, function(L_860_arg0)
					if L_860_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_860_arg0.UserInputType == Enum.UserInputType.Touch then
						L_851_ = false
					end
				end)
				function L_850_.OnChanged(L_861_arg0, L_862_arg1)
					L_850_.Changed = L_862_arg1
					L_849_:SafeCallback(L_862_arg1, L_850_.Value, L_850_.Value)
				end
				function L_850_.SetValue(L_863_arg0, L_864_arg1)
					local L_865_ = L_863_arg0.Value or L_864_arg1
					L_863_arg0.Value = L_849_.Utilities:Round(math.clamp(L_864_arg1, L_850_.Min, L_850_.Max), L_850_.Rounding)
					L_853_.Position = UDim2.new((L_863_arg0.Value - L_850_.Min) / (L_850_.Max - L_850_.Min), -7, 0.5, 0)
					L_855_.Size = UDim2.fromScale((L_863_arg0.Value - L_850_.Min) / (L_850_.Max - L_850_.Min), 1)
					L_856_.Text = tostring(L_863_arg0.Value)
					L_849_:SafeCallback(L_850_.Callback, L_863_arg0.Value, L_865_)
					L_849_:SafeCallback(L_850_.Changed, L_863_arg0.Value, L_865_)
				end
				L_842_.AddSignal(L_840_.InputChanged, function(L_866_arg0)
					if L_851_ and (L_866_arg0.UserInputType == Enum.UserInputType.MouseMovement or L_866_arg0.UserInputType == Enum.UserInputType.Touch) then
						local L_867_ = math.clamp((L_866_arg0.Position.X - L_854_.AbsolutePosition.X) / L_854_.AbsoluteSize.X, 0, 1)
						L_850_:SetValue(L_850_.Min + ((L_850_.Max - L_850_.Min) * L_867_))
					end
				end)
				L_842_.AddSignal(L_856_.FocusLost, function()
					L_850_:SetValue(tonumber(L_856_.Text) or L_850_.Value)
				end)
				function L_850_.Destroy(L_868_arg0)
					L_852_:Destroy()
					L_849_.Options[L_847_arg1] = nil
				end
				L_850_:SetValue(typeof(L_848_arg2.Default) == 'number' and L_848_arg2.Default or L_850_.Min)
				L_849_.Options[L_847_arg1] = L_850_
				return setmetatable(L_850_, {
					__newindex = function(L_869_arg0, L_870_arg1, L_871_arg2)
						if L_870_arg1 == 'Value' then
							return L_850_:SetValue(L_871_arg2)
						end
						return rawset(L_869_arg0, L_870_arg1, L_871_arg2)
					end
				})
			end
			return L_845_
		end)()
	end,
	[27] = function()
		local L_872_, L_873_, L_874_ = L_1_(27)
		return (function(...)
			local L_875_, L_876_ = game:GetService'TweenService', L_873_.Parent.Parent
			local L_877_ = L_874_(L_876_.Creator)
			local L_878_, L_879_, L_880_ = L_877_.New, L_876_.Components, {}
			L_880_.__index = L_880_
			L_880_.__type = 'Toggle'
			function L_880_.New(L_881_arg0, L_882_arg1, L_883_arg2)
				local L_884_ = L_881_arg0.Library
				assert(L_883_arg2.Title, 'Toggle - Missing Title')
				local L_885_, L_886_ = {
					Value = L_883_arg2.Default or false,
					Callback = L_883_arg2.Callback or function(L_890_arg0)
					end,
					Type = 'Toggle'
				}, L_874_(L_879_.Element)(L_883_arg2.Title, L_883_arg2.Description, L_881_arg0.Container, true)
				L_886_.DescLabel.Size = UDim2.new(1, -54, 0, 14)
				L_885_.SetTitle = L_886_.SetTitle
				L_885_.SetDesc = L_886_.SetDesc
				local L_887_, L_888_ = L_878_('ImageLabel', {
					AnchorPoint = Vector2.new(0, 0.5),
					Size = UDim2.fromOffset(14, 14),
					Position = UDim2.new(0, 2, 0.5, 0),
					Image = 'http://www.roblox.com/asset/?id=12266946128',
					ImageTransparency = 0.5,
					ThemeTag = {
						ImageColor3 = 'ToggleSlider'
					}
				}), L_878_('UIStroke', {
					Transparency = 0.5,
					ThemeTag = {
						Color = 'ToggleSlider'
					}
				})
				local L_889_ = L_878_('Frame', {
					Size = UDim2.fromOffset(36, 18),
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, -10, 0.5, 0),
					Parent = L_886_.Frame,
					BackgroundTransparency = 1,
					ThemeTag = {
						BackgroundColor3 = 'Accent'
					}
				}, {
					L_878_('UICorner', {
						CornerRadius = UDim.new(0, 9)
					}),
					L_888_,
					L_887_
				})
				function L_885_.OnChanged(L_891_arg0, L_892_arg1)
					L_885_.Changed = L_892_arg1
					L_884_:SafeCallback(L_892_arg1, L_885_.Value, L_885_.Value)
				end
				function L_885_.SetValue(L_893_arg0, L_894_arg1)
					L_894_arg1 = not not L_894_arg1
					L_885_.Value = L_894_arg1
					L_877_.OverrideTag(L_888_, {
						Color = L_885_.Value and 'Accent' or 'ToggleSlider'
					})
					L_877_.OverrideTag(L_887_, {
						ImageColor3 = L_885_.Value and 'ToggleToggled' or 'ToggleSlider'
					})
					L_887_:TweenPosition(UDim2.new(0, L_885_.Value and 19 or 2, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.25)
					L_875_:Create(L_889_, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundTransparency = L_885_.Value and 0 or 1
					}):Play()
					L_887_.ImageTransparency = L_885_.Value and 0 or 0.5
					L_884_:SafeCallback(L_885_.Callback, L_885_.Value)
					L_884_:SafeCallback(L_885_.Changed, L_885_.Value)
				end
				function L_885_.Destroy(L_895_arg0)
					L_886_:Destroy()
					L_884_.Options[L_882_arg1] = nil
				end
				L_877_.AddSignal(L_886_.Frame.MouseButton1Click, function()
					L_885_:SetValue(not L_885_.Value)
				end)
				L_885_:SetValue(L_885_.Value)
				L_884_.Options[L_882_arg1] = L_885_
				return setmetatable(L_885_, {
					__newindex = function(L_896_arg0, L_897_arg1, L_898_arg2)
						if L_897_arg1 == 'Value' then
							return L_885_:SetValue(L_898_arg2)
						end
						return rawset(L_896_arg0, L_897_arg1, L_898_arg2)
					end
				})
			end
			return L_880_
		end)()
	end,
	[28] = function()
		L_1_(28)
		return (function(...)
			local L_899_, L_900_, L_901_, L_902_, L_903_, L_904_, L_905_ = 'rbxassetid://18121130502', 'rbxassetid://18121123739', 'rbxassetid://18121123528', 'rbxassetid://18121123273', 'rbxassetid://18121122977', 'rbxassetid://18121122600', {['0_0'] = Vector2.new(0, 0),['64_0'] = Vector2.new(64, 0),['128_0'] = Vector2.new(128, 0),['192_0'] = Vector2.new(192, 0),['256_0'] = Vector2.new(256, 0),['320_0'] = Vector2.new(320, 0),['384_0'] = Vector2.new(384, 0),['448_0'] = Vector2.new(448, 0),['512_0'] = Vector2.new(512, 0),['576_0'] = Vector2.new(576, 0),['640_0'] = Vector2.new(640, 0),['704_0'] = Vector2.new(704, 0),['768_0'] = Vector2.new(768, 0),['832_0'] = Vector2.new(832, 0),['896_0'] = Vector2.new(896, 0),['960_0'] = Vector2.new(960, 0),['0_64'] = Vector2.new(0, 64),['64_64'] = Vector2.new(64, 64),['128_64'] = Vector2.new(128, 64),['192_64'] = Vector2.new(192, 64),['256_64'] = Vector2.new(256, 64),['320_64'] = Vector2.new(320, 64),['384_64'] = Vector2.new(384, 64),['448_64'] = Vector2.new(448, 64),['512_64'] = Vector2.new(512, 64),['576_64'] = Vector2.new(576, 64),['640_64'] = Vector2.new(640, 64),['704_64'] = Vector2.new(704, 64),['768_64'] = Vector2.new(768, 64),['832_64'] = Vector2.new(832, 64),['896_64'] = Vector2.new(896, 64),['960_64'] = Vector2.new(960, 64),['0_128'] = Vector2.new(0, 128),['64_128'] = Vector2.new(64, 128),['128_128'] = Vector2.new(128, 128),['192_128'] = Vector2.new(192, 128),['256_128'] = Vector2.new(256, 128),['320_128'] = Vector2.new(320, 128),['384_128'] = Vector2.new(384, 128),['448_128'] = Vector2.new(448, 128),['512_128'] = Vector2.new(512, 128),['576_128'] = Vector2.new(576, 128),['640_128'] = Vector2.new(640, 128),['704_128'] = Vector2.new(704, 128),['768_128'] = Vector2.new(768, 128),['832_128'] = Vector2.new(832, 128),['896_128'] = Vector2.new(896, 128),['960_128'] = Vector2.new(960, 128),['0_192'] = Vector2.new(0, 192),['64_192'] = Vector2.new(64, 192),['128_192'] = Vector2.new(128, 192),['192_192'] = Vector2.new(192, 192),['256_192'] = Vector2.new(256, 192),['320_192'] = Vector2.new(320, 192),['384_192'] = Vector2.new(384, 192),['448_192'] = Vector2.new(448, 192),['512_192'] = Vector2.new(512, 192),['576_192'] = Vector2.new(576, 192),['640_192'] = Vector2.new(640, 192),['704_192'] = Vector2.new(704, 192),['768_192'] = Vector2.new(768, 192),['832_192'] = Vector2.new(832, 192),['896_192'] = Vector2.new(896, 192),['960_192'] = Vector2.new(960, 192),['0_256'] = Vector2.new(0, 256),['64_256'] = Vector2.new(64, 256),['128_256'] = Vector2.new(128, 256),['192_256'] = Vector2.new(192, 256),['256_256'] = Vector2.new(256, 256),['320_256'] = Vector2.new(320, 256),['384_256'] = Vector2.new(384, 256),['448_256'] = Vector2.new(448, 256),['512_256'] = Vector2.new(512, 256),['576_256'] = Vector2.new(576, 256),['640_256'] = Vector2.new(640, 256),['704_256'] = Vector2.new(704, 256),['768_256'] = Vector2.new(768, 256),['832_256'] = Vector2.new(832, 256),['896_256'] = Vector2.new(896, 256),['960_256'] = Vector2.new(960, 256),['0_320'] = Vector2.new(0, 320),['64_320'] = Vector2.new(64, 320),['128_320'] = Vector2.new(128, 320),['192_320'] = Vector2.new(192, 320),['256_320'] = Vector2.new(256, 320),['320_320'] = Vector2.new(320, 320),['384_320'] = Vector2.new(384, 320),['448_320'] = Vector2.new(448, 320),['512_320'] = Vector2.new(512, 320),['576_320'] = Vector2.new(576, 320),['640_320'] = Vector2.new(640, 320),['704_320'] = Vector2.new(704, 320),['768_320'] = Vector2.new(768, 320),['832_320'] = Vector2.new(832, 320),['896_320'] = Vector2.new(896, 320),['960_320'] = Vector2.new(960, 320),['0_384'] = Vector2.new(0, 384),['64_384'] = Vector2.new(64, 384),['128_384'] = Vector2.new(128, 384),['192_384'] = Vector2.new(192, 384),['256_384'] = Vector2.new(256, 384),['320_384'] = Vector2.new(320, 384),['384_384'] = Vector2.new(384, 384),['448_384'] = Vector2.new(448, 384),['512_384'] = Vector2.new(512, 384),['576_384'] = Vector2.new(576, 384),['640_384'] = Vector2.new(640, 384),['704_384'] = Vector2.new(704, 384),['768_384'] = Vector2.new(768, 384),['832_384'] = Vector2.new(832, 384),['896_384'] = Vector2.new(896, 384),['960_384'] = Vector2.new(960, 384),['0_448'] = Vector2.new(0, 448),['64_448'] = Vector2.new(64, 448),['128_448'] = Vector2.new(128, 448),['192_448'] = Vector2.new(192, 448),['256_448'] = Vector2.new(256, 448),['320_448'] = Vector2.new(320, 448),['384_448'] = Vector2.new(384, 448),['448_448'] = Vector2.new(448, 448),['512_448'] = Vector2.new(512, 448),['576_448'] = Vector2.new(576, 448),['640_448'] = Vector2.new(640, 448),['704_448'] = Vector2.new(704, 448),['768_448'] = Vector2.new(768, 448),['832_448'] = Vector2.new(832, 448),['896_448'] = Vector2.new(896, 448),['960_448'] = Vector2.new(960, 448),['0_512'] = Vector2.new(0, 512),['64_512'] = Vector2.new(64, 512),['128_512'] = Vector2.new(128, 512),['192_512'] = Vector2.new(192, 512),['256_512'] = Vector2.new(256, 512),['320_512'] = Vector2.new(320, 512),['384_512'] = Vector2.new(384, 512),['448_512'] = Vector2.new(448, 512),['512_512'] = Vector2.new(512, 512),['576_512'] = Vector2.new(576, 512),['640_512'] = Vector2.new(640, 512),['704_512'] = Vector2.new(704, 512),['768_512'] = Vector2.new(768, 512),['832_512'] = Vector2.new(832, 512),['896_512'] = Vector2.new(896, 512),['960_512'] = Vector2.new(960, 512),['0_576'] = Vector2.new(0, 576),['64_576'] = Vector2.new(64, 576),['128_576'] = Vector2.new(128, 576),['192_576'] = Vector2.new(192, 576),['256_576'] = Vector2.new(256, 576),['320_576'] = Vector2.new(320, 576),['384_576'] = Vector2.new(384, 576),['448_576'] = Vector2.new(448, 576),['512_576'] = Vector2.new(512, 576),['576_576'] = Vector2.new(576, 576),['640_576'] = Vector2.new(640, 576),['704_576'] = Vector2.new(704, 576),['768_576'] = Vector2.new(768, 576),['832_576'] = Vector2.new(832, 576),['896_576'] = Vector2.new(896, 576),['960_576'] = Vector2.new(960, 576),['0_640'] = Vector2.new(0, 640),['64_640'] = Vector2.new(64, 640),['128_640'] = Vector2.new(128, 640),['192_640'] = Vector2.new(192, 640),['256_640'] = Vector2.new(256, 640),['320_640'] = Vector2.new(320, 640),['384_640'] = Vector2.new(384, 640),['448_640'] = Vector2.new(448, 640),['512_640'] = Vector2.new(512, 640),['576_640'] = Vector2.new(576, 640),['640_640'] = Vector2.new(640, 640),['704_640'] = Vector2.new(704, 640),['768_640'] = Vector2.new(768, 640),['832_640'] = Vector2.new(832, 640),['896_640'] = Vector2.new(896, 640),['960_640'] = Vector2.new(960, 640),['0_704'] = Vector2.new(0, 704),['64_704'] = Vector2.new(64, 704),['128_704'] = Vector2.new(128, 704),['192_704'] = Vector2.new(192, 704),['256_704'] = Vector2.new(256, 704),['320_704'] = Vector2.new(320, 704),['384_704'] = Vector2.new(384, 704),['448_704'] = Vector2.new(448, 704),['512_704'] = Vector2.new(512, 704),['576_704'] = Vector2.new(576, 704),['640_704'] = Vector2.new(640, 704),['704_704'] = Vector2.new(704, 704),['768_704'] = Vector2.new(768, 704),['832_704'] = Vector2.new(832, 704),['896_704'] = Vector2.new(896, 704),['960_704'] = Vector2.new(960, 704),['0_768'] = Vector2.new(0, 768),['64_768'] = Vector2.new(64, 768),['128_768'] = Vector2.new(128, 768),['192_768'] = Vector2.new(192, 768),['256_768'] = Vector2.new(256, 768),['320_768'] = Vector2.new(320, 768),['384_768'] = Vector2.new(384, 768),['448_768'] = Vector2.new(448, 768),['512_768'] = Vector2.new(512, 768),['576_768'] = Vector2.new(576, 768),['640_768'] = Vector2.new(640, 768),['704_768'] = Vector2.new(704, 768),['768_768'] = Vector2.new(768, 768),['832_768'] = Vector2.new(832, 768),['896_768'] = Vector2.new(896, 768),['960_768'] = Vector2.new(960, 768),['0_832'] = Vector2.new(0, 832),['64_832'] = Vector2.new(64, 832),['128_832'] = Vector2.new(128, 832),['192_832'] = Vector2.new(192, 832),['256_832'] = Vector2.new(256, 832),['320_832'] = Vector2.new(320, 832),['384_832'] = Vector2.new(384, 832),['448_832'] = Vector2.new(448, 832),['512_832'] = Vector2.new(512, 832),['576_832'] = Vector2.new(576, 832),['640_832'] = Vector2.new(640, 832),['704_832'] = Vector2.new(704, 832),['768_832'] = Vector2.new(768, 832),['832_832'] = Vector2.new(832, 832),['896_832'] = Vector2.new(896, 832),['960_832'] = Vector2.new(960, 832),['0_896'] = Vector2.new(0, 896),['64_896'] = Vector2.new(64, 896),['128_896'] = Vector2.new(128, 896),['192_896'] = Vector2.new(192, 896),['256_896'] = Vector2.new(256, 896),['320_896'] = Vector2.new(320, 896),['384_896'] = Vector2.new(384, 896),['448_896'] = Vector2.new(448, 896),['512_896'] = Vector2.new(512, 896),['576_896'] = Vector2.new(576, 896),['640_896'] = Vector2.new(640, 896),['704_896'] = Vector2.new(704, 896),['768_896'] = Vector2.new(768, 896),['832_896'] = Vector2.new(832, 896),['896_896'] = Vector2.new(896, 896),['960_896'] = Vector2.new(960, 896),['0_960'] = Vector2.new(0, 960),['64_960'] = Vector2.new(64, 960),['128_960'] = Vector2.new(128, 960),['192_960'] = Vector2.new(192, 960),['256_960'] = Vector2.new(256, 960),['320_960'] = Vector2.new(320, 960),['384_960'] = Vector2.new(384, 960),['448_960'] = Vector2.new(448, 960),['512_960'] = Vector2.new(512, 960),['576_960'] = Vector2.new(576, 960),['640_960'] = Vector2.new(640, 960),['704_960'] = Vector2.new(704, 960),['768_960'] = Vector2.new(768, 960),['832_960'] = Vector2.new(832, 960),['896_960'] = Vector2.new(896, 960),['960_960'] = Vector2.new(960, 960)}
			game:GetService'ContentProvider':PreloadAsync{
				L_899_,
				L_900_,
				L_901_,
				L_902_,
				L_903_,
				L_904_
			}
			return {SetIcon = function(L_906_arg0, L_907_arg1, L_908_arg2)
					local L_909_ = L_906_arg0[L_908_arg2]
					if typeof(L_909_) ~= 'table' then
						local L_910_, L_911_ = (math.huge)
						for L_912_forvar0, L_913_forvar1 in next, L_906_arg0 do
							local L_914_, L_915_ = L_912_forvar0, L_908_arg2;
							local L_916_, L_917_, L_918_ = # L_914_, # L_915_, {}
							for L_920_forvar0 = 0, L_916_ do
								L_918_[L_920_forvar0] = {}
								L_918_[L_920_forvar0][0] = L_920_forvar0
							end;
							for L_921_forvar0 = 0, L_917_ do
								L_918_[0][L_921_forvar0] = L_921_forvar0
							end;
							for L_922_forvar0 = 1, L_916_ do
								for L_923_forvar0 = 1, L_917_ do
									local L_924_ = (L_914_:sub(L_922_forvar0, L_922_forvar0) == L_915_:sub(L_923_forvar0, L_923_forvar0)) and 0 or 1;
									L_918_[L_922_forvar0][L_923_forvar0] = math.min(L_918_[L_922_forvar0 - 1][L_923_forvar0] + 1, L_918_[L_922_forvar0][L_923_forvar0 - 1] + 1, L_918_[L_922_forvar0 - 1][L_923_forvar0 - 1] + L_924_)
								end
							end;
							local L_919_ = L_918_[L_916_][L_917_]
							if L_919_ < L_910_ then
								L_910_ = L_919_;
								L_911_ = L_912_forvar0
							end
						end;
						if L_911_ then
							return error(debug.traceback("2145857225"))
						else
							return error(debug.traceback("3207118388"))
						end
					end;
					for L_925_forvar0, L_926_forvar1 in next, L_909_ do
						L_907_arg1[L_925_forvar0] = L_926_forvar1
					end
				end,Close = 'rbxassetid://9886659671',Min = 'rbxassetid://9886659276',Max = 'rbxassetid://9886659406',Restore = 'rbxassetid://9886659001',['a-arrow-down'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_0'],
					Image = L_899_
				},['a-arrow-up'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_0'],
					Image = L_899_
				},['a-large-small'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_0'],
					Image = L_899_
				},accessibility = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_0'],
					Image = L_899_
				},activity = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_0'],
					Image = L_899_
				},['air-vent'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_0'],
					Image = L_899_
				},airplay = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_0'],
					Image = L_899_
				},['alarm-clock-check'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_0'],
					Image = L_899_
				},['alarm-clock-minus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_0'],
					Image = L_899_
				},['alarm-clock-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_0'],
					Image = L_899_
				},['alarm-clock-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_0'],
					Image = L_899_
				},['alarm-clock'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_0'],
					Image = L_899_
				},['alarm-smoke'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_0'],
					Image = L_899_
				},album = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_0'],
					Image = L_899_
				},['align-center-horizontal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_0'],
					Image = L_899_
				},['align-center-vertical'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_0'],
					Image = L_899_
				},['align-center'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_64'],
					Image = L_899_
				},['align-end-horizontal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_64'],
					Image = L_899_
				},['align-end-vertical'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_64'],
					Image = L_899_
				},['align-horizontal-distribute-center'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_64'],
					Image = L_899_
				},['align-horizontal-distribute-end'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_64'],
					Image = L_899_
				},['align-horizontal-distribute-start'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_64'],
					Image = L_899_
				},['align-horizontal-justify-center'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_64'],
					Image = L_899_
				},['align-horizontal-justify-end'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_64'],
					Image = L_899_
				},['align-horizontal-justify-start'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_64'],
					Image = L_899_
				},['align-horizontal-space-around'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_64'],
					Image = L_899_
				},['align-horizontal-space-between'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_64'],
					Image = L_899_
				},['align-justify'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_64'],
					Image = L_899_
				},['align-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_64'],
					Image = L_899_
				},['align-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_64'],
					Image = L_899_
				},['align-start-horizontal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_64'],
					Image = L_899_
				},['align-start-vertical'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_64'],
					Image = L_899_
				},['align-vertical-distribute-center'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_128'],
					Image = L_899_
				},['align-vertical-distribute-end'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_128'],
					Image = L_899_
				},['align-vertical-distribute-start'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_128'],
					Image = L_899_
				},['align-vertical-justify-center'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_128'],
					Image = L_899_
				},['align-vertical-justify-end'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_128'],
					Image = L_899_
				},['align-vertical-justify-start'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_128'],
					Image = L_899_
				},['align-vertical-space-around'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_128'],
					Image = L_899_
				},['align-vertical-space-between'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_128'],
					Image = L_899_
				},ambulance = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_128'],
					Image = L_899_
				},ampersand = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_128'],
					Image = L_899_
				},ampersands = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_128'],
					Image = L_899_
				},anchor = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_128'],
					Image = L_899_
				},angry = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_128'],
					Image = L_899_
				},annoyed = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_128'],
					Image = L_899_
				},antenna = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_128'],
					Image = L_899_
				},anvil = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_128'],
					Image = L_899_
				},aperture = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_192'],
					Image = L_899_
				},['app-window-mac'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_192'],
					Image = L_899_
				},['app-window'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_192'],
					Image = L_899_
				},apple = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_192'],
					Image = L_899_
				},['archive-restore'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_192'],
					Image = L_899_
				},['archive-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_192'],
					Image = L_899_
				},archive = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_192'],
					Image = L_899_
				},['area-chart'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_192'],
					Image = L_899_
				},armchair = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_192'],
					Image = L_899_
				},['arrow-big-down-dash'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_192'],
					Image = L_899_
				},['arrow-big-down'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_192'],
					Image = L_899_
				},['arrow-big-left-dash'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_192'],
					Image = L_899_
				},['arrow-big-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_192'],
					Image = L_899_
				},['arrow-big-right-dash'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_192'],
					Image = L_899_
				},['arrow-big-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_192'],
					Image = L_899_
				},['arrow-big-up-dash'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_192'],
					Image = L_899_
				},['arrow-big-up'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_256'],
					Image = L_899_
				},['arrow-down-0-1'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_256'],
					Image = L_899_
				},['arrow-down-1-0'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_256'],
					Image = L_899_
				},['arrow-down-a-z'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_256'],
					Image = L_899_
				},['arrow-down-from-line'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_256'],
					Image = L_899_
				},['arrow-down-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_256'],
					Image = L_899_
				},['arrow-down-narrow-wide'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_256'],
					Image = L_899_
				},['arrow-down-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_256'],
					Image = L_899_
				},['arrow-down-to-dot'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_256'],
					Image = L_899_
				},['arrow-down-to-line'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_256'],
					Image = L_899_
				},['arrow-down-up'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_256'],
					Image = L_899_
				},['arrow-down-wide-narrow'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_256'],
					Image = L_899_
				},['arrow-down-z-a'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_256'],
					Image = L_899_
				},['arrow-down'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_256'],
					Image = L_899_
				},['arrow-left-from-line'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_256'],
					Image = L_899_
				},['arrow-left-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_256'],
					Image = L_899_
				},['arrow-left-to-line'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_320'],
					Image = L_899_
				},['arrow-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_320'],
					Image = L_899_
				},['arrow-right-from-line'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_320'],
					Image = L_899_
				},['arrow-right-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_320'],
					Image = L_899_
				},['arrow-right-to-line'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_320'],
					Image = L_899_
				},['arrow-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_320'],
					Image = L_899_
				},['arrow-up-0-1'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_320'],
					Image = L_899_
				},['arrow-up-1-0'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_320'],
					Image = L_899_
				},['arrow-up-a-z'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_320'],
					Image = L_899_
				},['arrow-up-down'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_320'],
					Image = L_899_
				},['arrow-up-from-dot'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_320'],
					Image = L_899_
				},['arrow-up-from-line'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_320'],
					Image = L_899_
				},['arrow-up-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_320'],
					Image = L_899_
				},['arrow-up-narrow-wide'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_320'],
					Image = L_899_
				},['arrow-up-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_320'],
					Image = L_899_
				},['arrow-up-to-line'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_320'],
					Image = L_899_
				},['arrow-up-wide-narrow'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_384'],
					Image = L_899_
				},['arrow-up-z-a'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_384'],
					Image = L_899_
				},['arrow-up'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_384'],
					Image = L_899_
				},['arrows-up-from-line'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_384'],
					Image = L_899_
				},asterisk = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_384'],
					Image = L_899_
				},['at-sign'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_384'],
					Image = L_899_
				},atom = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_384'],
					Image = L_899_
				},['audio-lines'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_384'],
					Image = L_899_
				},['audio-waveform'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_384'],
					Image = L_899_
				},award = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_384'],
					Image = L_899_
				},axe = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_384'],
					Image = L_899_
				},['axis-3d'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_384'],
					Image = L_899_
				},baby = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_384'],
					Image = L_899_
				},backpack = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_384'],
					Image = L_899_
				},['badge-alert'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_384'],
					Image = L_899_
				},['badge-cent'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_384'],
					Image = L_899_
				},['badge-check'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_448'],
					Image = L_899_
				},['badge-dollar-sign'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_448'],
					Image = L_899_
				},['badge-euro'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_448'],
					Image = L_899_
				},['badge-help'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_448'],
					Image = L_899_
				},['badge-indian-rupee'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_448'],
					Image = L_899_
				},['badge-info'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_448'],
					Image = L_899_
				},['badge-japanese-yen'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_448'],
					Image = L_899_
				},['badge-minus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_448'],
					Image = L_899_
				},['badge-percent'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_448'],
					Image = L_899_
				},['badge-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_448'],
					Image = L_899_
				},['badge-pound-sterling'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_448'],
					Image = L_899_
				},['badge-russian-ruble'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_448'],
					Image = L_899_
				},['badge-swiss-franc'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_448'],
					Image = L_899_
				},['badge-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_448'],
					Image = L_899_
				},badge = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_448'],
					Image = L_899_
				},['baggage-claim'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_448'],
					Image = L_899_
				},ban = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_512'],
					Image = L_899_
				},banana = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_512'],
					Image = L_899_
				},banknote = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_512'],
					Image = L_899_
				},['bar-chart-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_512'],
					Image = L_899_
				},['bar-chart-3'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_512'],
					Image = L_899_
				},['bar-chart-4'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_512'],
					Image = L_899_
				},['bar-chart-big'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_512'],
					Image = L_899_
				},['bar-chart-horizontal-big'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_512'],
					Image = L_899_
				},['bar-chart-horizontal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_512'],
					Image = L_899_
				},['bar-chart'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_512'],
					Image = L_899_
				},barcode = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_512'],
					Image = L_899_
				},baseline = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_512'],
					Image = L_899_
				},bath = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_512'],
					Image = L_899_
				},['battery-charging'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_512'],
					Image = L_899_
				},['battery-full'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_512'],
					Image = L_899_
				},['battery-low'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_512'],
					Image = L_899_
				},['battery-medium'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_576'],
					Image = L_899_
				},['battery-warning'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_576'],
					Image = L_899_
				},battery = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_576'],
					Image = L_899_
				},beaker = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_576'],
					Image = L_899_
				},['bean-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_576'],
					Image = L_899_
				},bean = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_576'],
					Image = L_899_
				},['bed-double'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_576'],
					Image = L_899_
				},['bed-single'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_576'],
					Image = L_899_
				},bed = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_576'],
					Image = L_899_
				},beef = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_576'],
					Image = L_899_
				},['beer-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_576'],
					Image = L_899_
				},beer = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_576'],
					Image = L_899_
				},['bell-dot'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_576'],
					Image = L_899_
				},['bell-electric'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_576'],
					Image = L_899_
				},['bell-minus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_576'],
					Image = L_899_
				},['bell-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_576'],
					Image = L_899_
				},['bell-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_640'],
					Image = L_899_
				},['bell-ring'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_640'],
					Image = L_899_
				},bell = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_640'],
					Image = L_899_
				},['between-horizontal-end'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_640'],
					Image = L_899_
				},['between-horizontal-start'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_640'],
					Image = L_899_
				},['between-vertical-end'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_640'],
					Image = L_899_
				},['between-vertical-start'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_640'],
					Image = L_899_
				},['biceps-flexed'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_640'],
					Image = L_899_
				},bike = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_640'],
					Image = L_899_
				},binary = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_640'],
					Image = L_899_
				},biohazard = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_640'],
					Image = L_899_
				},bird = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_640'],
					Image = L_899_
				},bitcoin = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_640'],
					Image = L_899_
				},blend = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_640'],
					Image = L_899_
				},blinds = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_640'],
					Image = L_899_
				},blocks = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_640'],
					Image = L_899_
				},['bluetooth-connected'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_704'],
					Image = L_899_
				},['bluetooth-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_704'],
					Image = L_899_
				},['bluetooth-searching'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_704'],
					Image = L_899_
				},bluetooth = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_704'],
					Image = L_899_
				},bold = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_704'],
					Image = L_899_
				},bolt = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_704'],
					Image = L_899_
				},bomb = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_704'],
					Image = L_899_
				},bone = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_704'],
					Image = L_899_
				},['book-a'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_704'],
					Image = L_899_
				},['book-audio'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_704'],
					Image = L_899_
				},['book-check'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_704'],
					Image = L_899_
				},['book-copy'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_704'],
					Image = L_899_
				},['book-dashed'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_704'],
					Image = L_899_
				},['book-down'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_704'],
					Image = L_899_
				},['book-headphones'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_704'],
					Image = L_899_
				},['book-heart'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_704'],
					Image = L_899_
				},['book-image'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_768'],
					Image = L_899_
				},['book-key'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_768'],
					Image = L_899_
				},['book-lock'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_768'],
					Image = L_899_
				},['book-marked'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_768'],
					Image = L_899_
				},['book-minus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_768'],
					Image = L_899_
				},['book-open-check'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_768'],
					Image = L_899_
				},['book-open-text'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_768'],
					Image = L_899_
				},['book-open'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_768'],
					Image = L_899_
				},['book-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_768'],
					Image = L_899_
				},['book-text'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_768'],
					Image = L_899_
				},['book-type'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_768'],
					Image = L_899_
				},['book-up-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_768'],
					Image = L_899_
				},['book-up'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_768'],
					Image = L_899_
				},['book-user'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_768'],
					Image = L_899_
				},['book-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_768'],
					Image = L_899_
				},book = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_768'],
					Image = L_899_
				},['bookmark-check'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_832'],
					Image = L_899_
				},['bookmark-minus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_832'],
					Image = L_899_
				},['bookmark-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_832'],
					Image = L_899_
				},['bookmark-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_832'],
					Image = L_899_
				},bookmark = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_832'],
					Image = L_899_
				},['boom-box'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_832'],
					Image = L_899_
				},['bot-message-square'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_832'],
					Image = L_899_
				},['bot-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_832'],
					Image = L_899_
				},bot = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_832'],
					Image = L_899_
				},['box-select'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_832'],
					Image = L_899_
				},box = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_832'],
					Image = L_899_
				},boxes = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_832'],
					Image = L_899_
				},braces = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_832'],
					Image = L_899_
				},brackets = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_832'],
					Image = L_899_
				},['brain-circuit'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_832'],
					Image = L_899_
				},['brain-cog'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_832'],
					Image = L_899_
				},brain = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_896'],
					Image = L_899_
				},['brick-wall'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_896'],
					Image = L_899_
				},['briefcase-business'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_896'],
					Image = L_899_
				},['briefcase-medical'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_896'],
					Image = L_899_
				},briefcase = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_896'],
					Image = L_899_
				},['bring-to-front'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_896'],
					Image = L_899_
				},brush = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_896'],
					Image = L_899_
				},['bug-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_896'],
					Image = L_899_
				},['bug-play'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_896'],
					Image = L_899_
				},bug = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_896'],
					Image = L_899_
				},['building-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_896'],
					Image = L_899_
				},building = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_896'],
					Image = L_899_
				},['bus-front'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_896'],
					Image = L_899_
				},bus = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_896'],
					Image = L_899_
				},['cable-car'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_896'],
					Image = L_899_
				},cable = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_896'],
					Image = L_899_
				},['cake-slice'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_960'],
					Image = L_899_
				},cake = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_960'],
					Image = L_899_
				},calculator = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_960'],
					Image = L_899_
				},['calendar-check-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_960'],
					Image = L_899_
				},['calendar-check'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_960'],
					Image = L_899_
				},['calendar-clock'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_960'],
					Image = L_899_
				},['calendar-cog'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_960'],
					Image = L_899_
				},['calendar-days'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_960'],
					Image = L_899_
				},['calendar-fold'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_960'],
					Image = L_899_
				},['calendar-heart'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_960'],
					Image = L_899_
				},['calendar-minus-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_960'],
					Image = L_899_
				},['calendar-minus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_960'],
					Image = L_899_
				},['calendar-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_960'],
					Image = L_899_
				},['calendar-plus-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_960'],
					Image = L_899_
				},['calendar-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_960'],
					Image = L_899_
				},['calendar-range'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_960'],
					Image = L_899_
				},['calendar-search'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_0'],
					Image = L_900_
				},['calendar-x-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_0'],
					Image = L_900_
				},['calendar-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_0'],
					Image = L_900_
				},calendar = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_0'],
					Image = L_900_
				},['camera-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_0'],
					Image = L_900_
				},camera = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_0'],
					Image = L_900_
				},['candlestick-chart'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_0'],
					Image = L_900_
				},['candy-cane'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_0'],
					Image = L_900_
				},['candy-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_0'],
					Image = L_900_
				},candy = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_0'],
					Image = L_900_
				},cannabis = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_0'],
					Image = L_900_
				},['captions-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_0'],
					Image = L_900_
				},captions = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_0'],
					Image = L_900_
				},['car-front'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_0'],
					Image = L_900_
				},['car-taxi-front'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_0'],
					Image = L_900_
				},car = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_0'],
					Image = L_900_
				},caravan = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_64'],
					Image = L_900_
				},carrot = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_64'],
					Image = L_900_
				},['case-lower'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_64'],
					Image = L_900_
				},['case-sensitive'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_64'],
					Image = L_900_
				},['case-upper'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_64'],
					Image = L_900_
				},['cassette-tape'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_64'],
					Image = L_900_
				},cast = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_64'],
					Image = L_900_
				},castle = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_64'],
					Image = L_900_
				},cat = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_64'],
					Image = L_900_
				},cctv = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_64'],
					Image = L_900_
				},['check-check'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_64'],
					Image = L_900_
				},check = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_64'],
					Image = L_900_
				},['chef-hat'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_64'],
					Image = L_900_
				},cherry = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_64'],
					Image = L_900_
				},['chevron-down'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_64'],
					Image = L_900_
				},['chevron-first'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_64'],
					Image = L_900_
				},['chevron-last'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_128'],
					Image = L_900_
				},['chevron-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_128'],
					Image = L_900_
				},['chevron-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_128'],
					Image = L_900_
				},['chevron-up'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_128'],
					Image = L_900_
				},['chevrons-down-up'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_128'],
					Image = L_900_
				},['chevrons-down'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_128'],
					Image = L_900_
				},['chevrons-left-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_128'],
					Image = L_900_
				},['chevrons-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_128'],
					Image = L_900_
				},['chevrons-right-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_128'],
					Image = L_900_
				},['chevrons-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_128'],
					Image = L_900_
				},['chevrons-up-down'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_128'],
					Image = L_900_
				},['chevrons-up'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_128'],
					Image = L_900_
				},chrome = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_128'],
					Image = L_900_
				},church = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_128'],
					Image = L_900_
				},['cigarette-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_128'],
					Image = L_900_
				},cigarette = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_128'],
					Image = L_900_
				},['circle-alert'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_192'],
					Image = L_900_
				},['circle-arrow-down'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_192'],
					Image = L_900_
				},['circle-arrow-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_192'],
					Image = L_900_
				},['circle-arrow-out-down-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_192'],
					Image = L_900_
				},['circle-arrow-out-down-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_192'],
					Image = L_900_
				},['circle-arrow-out-up-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_192'],
					Image = L_900_
				},['circle-arrow-out-up-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_192'],
					Image = L_900_
				},['circle-arrow-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_192'],
					Image = L_900_
				},['circle-arrow-up'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_192'],
					Image = L_900_
				},['circle-check-big'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_192'],
					Image = L_900_
				},['circle-check'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_192'],
					Image = L_900_
				},['circle-chevron-down'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_192'],
					Image = L_900_
				},['circle-chevron-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_192'],
					Image = L_900_
				},['circle-chevron-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_192'],
					Image = L_900_
				},['circle-chevron-up'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_192'],
					Image = L_900_
				},['circle-dashed'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_192'],
					Image = L_900_
				},['circle-divide'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_256'],
					Image = L_900_
				},['circle-dollar-sign'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_256'],
					Image = L_900_
				},['circle-dot-dashed'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_256'],
					Image = L_900_
				},['circle-dot'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_256'],
					Image = L_900_
				},['circle-ellipsis'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_256'],
					Image = L_900_
				},['circle-equal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_256'],
					Image = L_900_
				},['circle-fading-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_256'],
					Image = L_900_
				},['circle-gauge'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_256'],
					Image = L_900_
				},['circle-help'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_256'],
					Image = L_900_
				},['circle-minus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_256'],
					Image = L_900_
				},['circle-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_256'],
					Image = L_900_
				},['circle-parking-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_256'],
					Image = L_900_
				},['circle-parking'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_256'],
					Image = L_900_
				},['circle-pause'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_256'],
					Image = L_900_
				},['circle-percent'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_256'],
					Image = L_900_
				},['circle-play'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_256'],
					Image = L_900_
				},['circle-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_320'],
					Image = L_900_
				},['circle-power'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_320'],
					Image = L_900_
				},['circle-slash-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_320'],
					Image = L_900_
				},['circle-slash'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_320'],
					Image = L_900_
				},['circle-stop'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_320'],
					Image = L_900_
				},['circle-user-round'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_320'],
					Image = L_900_
				},['circle-user'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_320'],
					Image = L_900_
				},['circle-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_320'],
					Image = L_900_
				},circle = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_320'],
					Image = L_900_
				},['circuit-board'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_320'],
					Image = L_900_
				},citrus = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_320'],
					Image = L_900_
				},clapperboard = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_320'],
					Image = L_900_
				},['clipboard-check'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_320'],
					Image = L_900_
				},['clipboard-copy'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_320'],
					Image = L_900_
				},['clipboard-list'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_320'],
					Image = L_900_
				},['clipboard-minus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_320'],
					Image = L_900_
				},['clipboard-paste'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_384'],
					Image = L_900_
				},['clipboard-pen-line'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_384'],
					Image = L_900_
				},['clipboard-pen'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_384'],
					Image = L_900_
				},['clipboard-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_384'],
					Image = L_900_
				},['clipboard-type'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_384'],
					Image = L_900_
				},['clipboard-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_384'],
					Image = L_900_
				},clipboard = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_384'],
					Image = L_900_
				},['clock-1'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_384'],
					Image = L_900_
				},['clock-10'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_384'],
					Image = L_900_
				},['clock-11'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_384'],
					Image = L_900_
				},['clock-12'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_384'],
					Image = L_900_
				},['clock-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_384'],
					Image = L_900_
				},['clock-3'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_384'],
					Image = L_900_
				},['clock-4'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_384'],
					Image = L_900_
				},['clock-5'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_384'],
					Image = L_900_
				},['clock-6'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_384'],
					Image = L_900_
				},['clock-7'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_448'],
					Image = L_900_
				},['clock-8'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_448'],
					Image = L_900_
				},['clock-9'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_448'],
					Image = L_900_
				},clock = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_448'],
					Image = L_900_
				},['cloud-cog'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_448'],
					Image = L_900_
				},['cloud-download'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_448'],
					Image = L_900_
				},['cloud-drizzle'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_448'],
					Image = L_900_
				},['cloud-fog'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_448'],
					Image = L_900_
				},['cloud-hail'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_448'],
					Image = L_900_
				},['cloud-lightning'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_448'],
					Image = L_900_
				},['cloud-moon-rain'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_448'],
					Image = L_900_
				},['cloud-moon'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_448'],
					Image = L_900_
				},['cloud-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_448'],
					Image = L_900_
				},['cloud-rain-wind'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_448'],
					Image = L_900_
				},['cloud-rain'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_448'],
					Image = L_900_
				},['cloud-snow'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_448'],
					Image = L_900_
				},['cloud-sun-rain'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_512'],
					Image = L_900_
				},['cloud-sun'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_512'],
					Image = L_900_
				},['cloud-upload'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_512'],
					Image = L_900_
				},cloud = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_512'],
					Image = L_900_
				},cloudy = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_512'],
					Image = L_900_
				},clover = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_512'],
					Image = L_900_
				},club = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_512'],
					Image = L_900_
				},['code-xml'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_512'],
					Image = L_900_
				},code = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_512'],
					Image = L_900_
				},codepen = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_512'],
					Image = L_900_
				},codesandbox = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_512'],
					Image = L_900_
				},coffee = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_512'],
					Image = L_900_
				},cog = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_512'],
					Image = L_900_
				},coins = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_512'],
					Image = L_900_
				},['columns-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_512'],
					Image = L_900_
				},['columns-3'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_512'],
					Image = L_900_
				},['columns-4'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_576'],
					Image = L_900_
				},combine = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_576'],
					Image = L_900_
				},command = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_576'],
					Image = L_900_
				},compass = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_576'],
					Image = L_900_
				},component = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_576'],
					Image = L_900_
				},computer = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_576'],
					Image = L_900_
				},['concierge-bell'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_576'],
					Image = L_900_
				},cone = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_576'],
					Image = L_900_
				},construction = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_576'],
					Image = L_900_
				},['contact-round'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_576'],
					Image = L_900_
				},contact = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_576'],
					Image = L_900_
				},container = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_576'],
					Image = L_900_
				},contrast = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_576'],
					Image = L_900_
				},cookie = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_576'],
					Image = L_900_
				},['cooking-pot'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_576'],
					Image = L_900_
				},['copy-check'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_576'],
					Image = L_900_
				},['copy-minus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_640'],
					Image = L_900_
				},['copy-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_640'],
					Image = L_900_
				},['copy-slash'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_640'],
					Image = L_900_
				},['copy-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_640'],
					Image = L_900_
				},copy = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_640'],
					Image = L_900_
				},copyleft = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_640'],
					Image = L_900_
				},copyright = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_640'],
					Image = L_900_
				},['corner-down-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_640'],
					Image = L_900_
				},['corner-down-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_640'],
					Image = L_900_
				},['corner-left-down'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_640'],
					Image = L_900_
				},['corner-left-up'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_640'],
					Image = L_900_
				},['corner-right-down'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_640'],
					Image = L_900_
				},['corner-right-up'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_640'],
					Image = L_900_
				},['corner-up-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_640'],
					Image = L_900_
				},['corner-up-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_640'],
					Image = L_900_
				},cpu = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_640'],
					Image = L_900_
				},['creative-commons'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_704'],
					Image = L_900_
				},['credit-card'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_704'],
					Image = L_900_
				},croissant = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_704'],
					Image = L_900_
				},crop = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_704'],
					Image = L_900_
				},cross = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_704'],
					Image = L_900_
				},crosshair = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_704'],
					Image = L_900_
				},crown = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_704'],
					Image = L_900_
				},cuboid = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_704'],
					Image = L_900_
				},['cup-soda'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_704'],
					Image = L_900_
				},currency = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_704'],
					Image = L_900_
				},cylinder = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_704'],
					Image = L_900_
				},['database-backup'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_704'],
					Image = L_900_
				},['database-zap'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_704'],
					Image = L_900_
				},database = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_704'],
					Image = L_900_
				},delete = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_704'],
					Image = L_900_
				},dessert = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_704'],
					Image = L_900_
				},diameter = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_768'],
					Image = L_900_
				},['diamond-minus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_768'],
					Image = L_900_
				},['diamond-percent'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_768'],
					Image = L_900_
				},['diamond-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_768'],
					Image = L_900_
				},diamond = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_768'],
					Image = L_900_
				},['dice-1'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_768'],
					Image = L_900_
				},['dice-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_768'],
					Image = L_900_
				},['dice-3'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_768'],
					Image = L_900_
				},['dice-4'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_768'],
					Image = L_900_
				},['dice-5'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_768'],
					Image = L_900_
				},['dice-6'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_768'],
					Image = L_900_
				},dices = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_768'],
					Image = L_900_
				},diff = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_768'],
					Image = L_900_
				},['disc-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_768'],
					Image = L_900_
				},['disc-3'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_768'],
					Image = L_900_
				},['disc-album'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_768'],
					Image = L_900_
				},disc = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_832'],
					Image = L_900_
				},divide = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_832'],
					Image = L_900_
				},['dna-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_832'],
					Image = L_900_
				},dna = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_832'],
					Image = L_900_
				},dock = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_832'],
					Image = L_900_
				},dog = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_832'],
					Image = L_900_
				},['dollar-sign'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_832'],
					Image = L_900_
				},donut = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_832'],
					Image = L_900_
				},['door-closed'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_832'],
					Image = L_900_
				},['door-open'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_832'],
					Image = L_900_
				},dot = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_832'],
					Image = L_900_
				},download = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_832'],
					Image = L_900_
				},['drafting-compass'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_832'],
					Image = L_900_
				},drama = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_832'],
					Image = L_900_
				},dribbble = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_832'],
					Image = L_900_
				},drill = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_832'],
					Image = L_900_
				},droplet = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_896'],
					Image = L_900_
				},droplets = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_896'],
					Image = L_900_
				},drum = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_896'],
					Image = L_900_
				},drumstick = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_896'],
					Image = L_900_
				},dumbbell = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_896'],
					Image = L_900_
				},['ear-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_896'],
					Image = L_900_
				},ear = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_896'],
					Image = L_900_
				},['earth-lock'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_896'],
					Image = L_900_
				},earth = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_896'],
					Image = L_900_
				},eclipse = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_896'],
					Image = L_900_
				},['egg-fried'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_896'],
					Image = L_900_
				},['egg-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_896'],
					Image = L_900_
				},egg = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_896'],
					Image = L_900_
				},['ellipsis-vertical'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_896'],
					Image = L_900_
				},ellipsis = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_896'],
					Image = L_900_
				},['equal-not'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_896'],
					Image = L_900_
				},equal = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_960'],
					Image = L_900_
				},eraser = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_960'],
					Image = L_900_
				},euro = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_960'],
					Image = L_900_
				},expand = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_960'],
					Image = L_900_
				},['external-link'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_960'],
					Image = L_900_
				},['eye-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_960'],
					Image = L_900_
				},eye = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_960'],
					Image = L_900_
				},facebook = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_960'],
					Image = L_900_
				},factory = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_960'],
					Image = L_900_
				},fan = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_960'],
					Image = L_900_
				},['fast-forward'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_960'],
					Image = L_900_
				},feather = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_960'],
					Image = L_900_
				},fence = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_960'],
					Image = L_900_
				},['ferris-wheel'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_960'],
					Image = L_900_
				},figma = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_960'],
					Image = L_900_
				},['file-archive'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_960'],
					Image = L_900_
				},['file-audio-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_0'],
					Image = L_901_
				},['file-audio'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_0'],
					Image = L_901_
				},['file-axis-3d'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_0'],
					Image = L_901_
				},['file-badge-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_0'],
					Image = L_901_
				},['file-badge'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_0'],
					Image = L_901_
				},['file-bar-chart-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_0'],
					Image = L_901_
				},['file-bar-chart'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_0'],
					Image = L_901_
				},['file-box'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_0'],
					Image = L_901_
				},['file-check-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_0'],
					Image = L_901_
				},['file-check'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_0'],
					Image = L_901_
				},['file-clock'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_0'],
					Image = L_901_
				},['file-code-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_0'],
					Image = L_901_
				},['file-code'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_0'],
					Image = L_901_
				},['file-cog'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_0'],
					Image = L_901_
				},['file-diff'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_0'],
					Image = L_901_
				},['file-digit'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_0'],
					Image = L_901_
				},['file-down'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_64'],
					Image = L_901_
				},['file-heart'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_64'],
					Image = L_901_
				},['file-image'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_64'],
					Image = L_901_
				},['file-input'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_64'],
					Image = L_901_
				},['file-json-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_64'],
					Image = L_901_
				},['file-json'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_64'],
					Image = L_901_
				},['file-key-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_64'],
					Image = L_901_
				},['file-key'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_64'],
					Image = L_901_
				},['file-line-chart'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_64'],
					Image = L_901_
				},['file-lock-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_64'],
					Image = L_901_
				},['file-lock'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_64'],
					Image = L_901_
				},['file-minus-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_64'],
					Image = L_901_
				},['file-minus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_64'],
					Image = L_901_
				},['file-music'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_64'],
					Image = L_901_
				},['file-output'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_64'],
					Image = L_901_
				},['file-pen-line'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_64'],
					Image = L_901_
				},['file-pen'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_128'],
					Image = L_901_
				},['file-pie-chart'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_128'],
					Image = L_901_
				},['file-plus-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_128'],
					Image = L_901_
				},['file-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_128'],
					Image = L_901_
				},['file-question'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_128'],
					Image = L_901_
				},['file-scan'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_128'],
					Image = L_901_
				},['file-search-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_128'],
					Image = L_901_
				},['file-search'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_128'],
					Image = L_901_
				},['file-sliders'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_128'],
					Image = L_901_
				},['file-spreadsheet'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_128'],
					Image = L_901_
				},['file-stack'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_128'],
					Image = L_901_
				},['file-symlink'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_128'],
					Image = L_901_
				},['file-terminal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_128'],
					Image = L_901_
				},['file-text'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_128'],
					Image = L_901_
				},['file-type-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_128'],
					Image = L_901_
				},['file-type'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_128'],
					Image = L_901_
				},['file-up'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_192'],
					Image = L_901_
				},['file-video-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_192'],
					Image = L_901_
				},['file-video'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_192'],
					Image = L_901_
				},['file-volume-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_192'],
					Image = L_901_
				},['file-volume'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_192'],
					Image = L_901_
				},['file-warning'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_192'],
					Image = L_901_
				},['file-x-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_192'],
					Image = L_901_
				},['file-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_192'],
					Image = L_901_
				},file = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_192'],
					Image = L_901_
				},files = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_192'],
					Image = L_901_
				},film = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_192'],
					Image = L_901_
				},['filter-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_192'],
					Image = L_901_
				},filter = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_192'],
					Image = L_901_
				},fingerprint = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_192'],
					Image = L_901_
				},['fire-extinguisher'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_192'],
					Image = L_901_
				},['fish-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_192'],
					Image = L_901_
				},['fish-symbol'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_256'],
					Image = L_901_
				},fish = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_256'],
					Image = L_901_
				},['flag-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_256'],
					Image = L_901_
				},['flag-triangle-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_256'],
					Image = L_901_
				},['flag-triangle-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_256'],
					Image = L_901_
				},flag = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_256'],
					Image = L_901_
				},['flame-kindling'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_256'],
					Image = L_901_
				},flame = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_256'],
					Image = L_901_
				},['flashlight-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_256'],
					Image = L_901_
				},flashlight = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_256'],
					Image = L_901_
				},['flask-conical-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_256'],
					Image = L_901_
				},['flask-conical'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_256'],
					Image = L_901_
				},['flask-round'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_256'],
					Image = L_901_
				},['flip-horizontal-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_256'],
					Image = L_901_
				},['flip-horizontal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_256'],
					Image = L_901_
				},['flip-vertical-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_256'],
					Image = L_901_
				},['flip-vertical'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_320'],
					Image = L_901_
				},['flower-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_320'],
					Image = L_901_
				},flower = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_320'],
					Image = L_901_
				},focus = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_320'],
					Image = L_901_
				},['fold-horizontal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_320'],
					Image = L_901_
				},['fold-vertical'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_320'],
					Image = L_901_
				},['folder-archive'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_320'],
					Image = L_901_
				},['folder-check'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_320'],
					Image = L_901_
				},['folder-clock'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_320'],
					Image = L_901_
				},['folder-closed'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_320'],
					Image = L_901_
				},['folder-cog'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_320'],
					Image = L_901_
				},['folder-dot'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_320'],
					Image = L_901_
				},['folder-down'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_320'],
					Image = L_901_
				},['folder-git-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_320'],
					Image = L_901_
				},['folder-git'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_320'],
					Image = L_901_
				},['folder-heart'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_320'],
					Image = L_901_
				},['folder-input'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_384'],
					Image = L_901_
				},['folder-kanban'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_384'],
					Image = L_901_
				},['folder-key'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_384'],
					Image = L_901_
				},['folder-lock'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_384'],
					Image = L_901_
				},['folder-minus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_384'],
					Image = L_901_
				},['folder-open-dot'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_384'],
					Image = L_901_
				},['folder-open'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_384'],
					Image = L_901_
				},['folder-output'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_384'],
					Image = L_901_
				},['folder-pen'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_384'],
					Image = L_901_
				},['folder-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_384'],
					Image = L_901_
				},['folder-root'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_384'],
					Image = L_901_
				},['folder-search-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_384'],
					Image = L_901_
				},['folder-search'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_384'],
					Image = L_901_
				},['folder-symlink'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_384'],
					Image = L_901_
				},['folder-sync'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_384'],
					Image = L_901_
				},['folder-tree'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_384'],
					Image = L_901_
				},['folder-up'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_448'],
					Image = L_901_
				},['folder-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_448'],
					Image = L_901_
				},folder = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_448'],
					Image = L_901_
				},folders = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_448'],
					Image = L_901_
				},footprints = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_448'],
					Image = L_901_
				},forklift = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_448'],
					Image = L_901_
				},forward = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_448'],
					Image = L_901_
				},frame = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_448'],
					Image = L_901_
				},framer = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_448'],
					Image = L_901_
				},frown = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_448'],
					Image = L_901_
				},fuel = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_448'],
					Image = L_901_
				},fullscreen = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_448'],
					Image = L_901_
				},['gallery-horizontal-end'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_448'],
					Image = L_901_
				},['gallery-horizontal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_448'],
					Image = L_901_
				},['gallery-thumbnails'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_448'],
					Image = L_901_
				},['gallery-vertical-end'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_448'],
					Image = L_901_
				},['gallery-vertical'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_512'],
					Image = L_901_
				},['gamepad-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_512'],
					Image = L_901_
				},gamepad = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_512'],
					Image = L_901_
				},['gantt-chart'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_512'],
					Image = L_901_
				},gauge = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_512'],
					Image = L_901_
				},gavel = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_512'],
					Image = L_901_
				},gem = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_512'],
					Image = L_901_
				},ghost = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_512'],
					Image = L_901_
				},gift = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_512'],
					Image = L_901_
				},['git-branch-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_512'],
					Image = L_901_
				},['git-branch'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_512'],
					Image = L_901_
				},['git-commit-horizontal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_512'],
					Image = L_901_
				},['git-commit-vertical'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_512'],
					Image = L_901_
				},['git-compare-arrows'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_512'],
					Image = L_901_
				},['git-compare'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_512'],
					Image = L_901_
				},['git-fork'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_512'],
					Image = L_901_
				},['git-graph'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_576'],
					Image = L_901_
				},['git-merge'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_576'],
					Image = L_901_
				},['git-pull-request-arrow'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_576'],
					Image = L_901_
				},['git-pull-request-closed'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_576'],
					Image = L_901_
				},['git-pull-request-create-arrow'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_576'],
					Image = L_901_
				},['git-pull-request-create'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_576'],
					Image = L_901_
				},['git-pull-request-draft'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_576'],
					Image = L_901_
				},['git-pull-request'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_576'],
					Image = L_901_
				},github = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_576'],
					Image = L_901_
				},gitlab = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_576'],
					Image = L_901_
				},['glass-water'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_576'],
					Image = L_901_
				},glasses = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_576'],
					Image = L_901_
				},['globe-lock'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_576'],
					Image = L_901_
				},globe = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_576'],
					Image = L_901_
				},goal = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_576'],
					Image = L_901_
				},grab = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_576'],
					Image = L_901_
				},['graduation-cap'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_640'],
					Image = L_901_
				},grape = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_640'],
					Image = L_901_
				},['grid-2x2-check'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_640'],
					Image = L_901_
				},['grid-2x2-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_640'],
					Image = L_901_
				},['grid-2x2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_640'],
					Image = L_901_
				},['grid-3x3'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_640'],
					Image = L_901_
				},['grip-horizontal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_640'],
					Image = L_901_
				},['grip-vertical'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_640'],
					Image = L_901_
				},grip = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_640'],
					Image = L_901_
				},group = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_640'],
					Image = L_901_
				},guitar = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_640'],
					Image = L_901_
				},ham = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_640'],
					Image = L_901_
				},hammer = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_640'],
					Image = L_901_
				},['hand-coins'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_640'],
					Image = L_901_
				},['hand-heart'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_640'],
					Image = L_901_
				},['hand-helping'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_640'],
					Image = L_901_
				},['hand-metal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_704'],
					Image = L_901_
				},['hand-platter'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_704'],
					Image = L_901_
				},hand = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_704'],
					Image = L_901_
				},handshake = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_704'],
					Image = L_901_
				},['hard-drive-download'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_704'],
					Image = L_901_
				},['hard-drive-upload'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_704'],
					Image = L_901_
				},['hard-drive'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_704'],
					Image = L_901_
				},['hard-hat'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_704'],
					Image = L_901_
				},hash = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_704'],
					Image = L_901_
				},haze = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_704'],
					Image = L_901_
				},['hdmi-port'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_704'],
					Image = L_901_
				},['heading-1'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_704'],
					Image = L_901_
				},['heading-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_704'],
					Image = L_901_
				},['heading-3'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_704'],
					Image = L_901_
				},['heading-4'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_704'],
					Image = L_901_
				},['heading-5'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_704'],
					Image = L_901_
				},['heading-6'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_768'],
					Image = L_901_
				},heading = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_768'],
					Image = L_901_
				},headphones = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_768'],
					Image = L_901_
				},headset = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_768'],
					Image = L_901_
				},['heart-crack'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_768'],
					Image = L_901_
				},['heart-handshake'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_768'],
					Image = L_901_
				},['heart-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_768'],
					Image = L_901_
				},['heart-pulse'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_768'],
					Image = L_901_
				},heart = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_768'],
					Image = L_901_
				},heater = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_768'],
					Image = L_901_
				},hexagon = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_768'],
					Image = L_901_
				},highlighter = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_768'],
					Image = L_901_
				},history = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_768'],
					Image = L_901_
				},home = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_768'],
					Image = L_901_
				},['hop-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_768'],
					Image = L_901_
				},hop = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_768'],
					Image = L_901_
				},hospital = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_832'],
					Image = L_901_
				},hotel = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_832'],
					Image = L_901_
				},hourglass = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_832'],
					Image = L_901_
				},['ice-cream-bowl'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_832'],
					Image = L_901_
				},['ice-cream-cone'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_832'],
					Image = L_901_
				},['image-down'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_832'],
					Image = L_901_
				},['image-minus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_832'],
					Image = L_901_
				},['image-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_832'],
					Image = L_901_
				},['image-play'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_832'],
					Image = L_901_
				},['image-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_832'],
					Image = L_901_
				},['image-up'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_832'],
					Image = L_901_
				},image = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_832'],
					Image = L_901_
				},images = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_832'],
					Image = L_901_
				},import = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_832'],
					Image = L_901_
				},inbox = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_832'],
					Image = L_901_
				},['indent-decrease'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_832'],
					Image = L_901_
				},['indent-increase'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_896'],
					Image = L_901_
				},['indian-rupee'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_896'],
					Image = L_901_
				},infinity = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_896'],
					Image = L_901_
				},info = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_896'],
					Image = L_901_
				},['inspection-panel'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_896'],
					Image = L_901_
				},instagram = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_896'],
					Image = L_901_
				},italic = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_896'],
					Image = L_901_
				},['iteration-ccw'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_896'],
					Image = L_901_
				},['iteration-cw'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_896'],
					Image = L_901_
				},['japanese-yen'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_896'],
					Image = L_901_
				},joystick = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_896'],
					Image = L_901_
				},kanban = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_896'],
					Image = L_901_
				},['key-round'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_896'],
					Image = L_901_
				},['key-square'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_896'],
					Image = L_901_
				},key = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_896'],
					Image = L_901_
				},['keyboard-music'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_896'],
					Image = L_901_
				},['keyboard-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_960'],
					Image = L_901_
				},keyboard = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_960'],
					Image = L_901_
				},['lamp-ceiling'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_960'],
					Image = L_901_
				},['lamp-desk'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_960'],
					Image = L_901_
				},['lamp-floor'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_960'],
					Image = L_901_
				},['lamp-wall-down'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_960'],
					Image = L_901_
				},['lamp-wall-up'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_960'],
					Image = L_901_
				},lamp = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_960'],
					Image = L_901_
				},['land-plot'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_960'],
					Image = L_901_
				},landmark = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_960'],
					Image = L_901_
				},languages = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_960'],
					Image = L_901_
				},['laptop-minimal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_960'],
					Image = L_901_
				},laptop = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_960'],
					Image = L_901_
				},['lasso-select'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_960'],
					Image = L_901_
				},lasso = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_960'],
					Image = L_901_
				},laugh = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_960'],
					Image = L_901_
				},['layers-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_0'],
					Image = L_902_
				},['layers-3'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_0'],
					Image = L_902_
				},layers = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_0'],
					Image = L_902_
				},['layout-dashboard'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_0'],
					Image = L_902_
				},['layout-grid'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_0'],
					Image = L_902_
				},['layout-list'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_0'],
					Image = L_902_
				},['layout-panel-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_0'],
					Image = L_902_
				},['layout-panel-top'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_0'],
					Image = L_902_
				},['layout-template'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_0'],
					Image = L_902_
				},leaf = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_0'],
					Image = L_902_
				},['leafy-green'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_0'],
					Image = L_902_
				},lectern = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_0'],
					Image = L_902_
				},['library-big'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_0'],
					Image = L_902_
				},library = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_0'],
					Image = L_902_
				},['life-buoy'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_0'],
					Image = L_902_
				},ligature = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_0'],
					Image = L_902_
				},['lightbulb-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_64'],
					Image = L_902_
				},lightbulb = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_64'],
					Image = L_902_
				},['line-chart'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_64'],
					Image = L_902_
				},['link-2-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_64'],
					Image = L_902_
				},['link-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_64'],
					Image = L_902_
				},link = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_64'],
					Image = L_902_
				},linkedin = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_64'],
					Image = L_902_
				},['list-checks'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_64'],
					Image = L_902_
				},['list-collapse'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_64'],
					Image = L_902_
				},['list-end'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_64'],
					Image = L_902_
				},['list-filter'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_64'],
					Image = L_902_
				},['list-minus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_64'],
					Image = L_902_
				},['list-music'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_64'],
					Image = L_902_
				},['list-ordered'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_64'],
					Image = L_902_
				},['list-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_64'],
					Image = L_902_
				},['list-restart'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_64'],
					Image = L_902_
				},['list-start'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_128'],
					Image = L_902_
				},['list-todo'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_128'],
					Image = L_902_
				},['list-tree'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_128'],
					Image = L_902_
				},['list-video'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_128'],
					Image = L_902_
				},['list-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_128'],
					Image = L_902_
				},list = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_128'],
					Image = L_902_
				},['loader-circle'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_128'],
					Image = L_902_
				},['loader-pinwheel'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_128'],
					Image = L_902_
				},loader = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_128'],
					Image = L_902_
				},['locate-fixed'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_128'],
					Image = L_902_
				},['locate-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_128'],
					Image = L_902_
				},locate = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_128'],
					Image = L_902_
				},['lock-keyhole-open'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_128'],
					Image = L_902_
				},['lock-keyhole'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_128'],
					Image = L_902_
				},['lock-open'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_128'],
					Image = L_902_
				},lock = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_128'],
					Image = L_902_
				},['log-in'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_192'],
					Image = L_902_
				},['log-out'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_192'],
					Image = L_902_
				},lollipop = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_192'],
					Image = L_902_
				},luggage = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_192'],
					Image = L_902_
				},magnet = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_192'],
					Image = L_902_
				},['mail-check'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_192'],
					Image = L_902_
				},['mail-minus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_192'],
					Image = L_902_
				},['mail-open'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_192'],
					Image = L_902_
				},['mail-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_192'],
					Image = L_902_
				},['mail-question'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_192'],
					Image = L_902_
				},['mail-search'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_192'],
					Image = L_902_
				},['mail-warning'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_192'],
					Image = L_902_
				},['mail-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_192'],
					Image = L_902_
				},mail = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_192'],
					Image = L_902_
				},mailbox = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_192'],
					Image = L_902_
				},mails = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_192'],
					Image = L_902_
				},['map-pin-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_256'],
					Image = L_902_
				},['map-pin'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_256'],
					Image = L_902_
				},['map-pinned'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_256'],
					Image = L_902_
				},map = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_256'],
					Image = L_902_
				},martini = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_256'],
					Image = L_902_
				},['maximize-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_256'],
					Image = L_902_
				},maximize = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_256'],
					Image = L_902_
				},medal = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_256'],
					Image = L_902_
				},['megaphone-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_256'],
					Image = L_902_
				},megaphone = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_256'],
					Image = L_902_
				},meh = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_256'],
					Image = L_902_
				},['memory-stick'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_256'],
					Image = L_902_
				},menu = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_256'],
					Image = L_902_
				},merge = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_256'],
					Image = L_902_
				},['message-circle-code'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_256'],
					Image = L_902_
				},['message-circle-dashed'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_256'],
					Image = L_902_
				},['message-circle-heart'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_320'],
					Image = L_902_
				},['message-circle-more'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_320'],
					Image = L_902_
				},['message-circle-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_320'],
					Image = L_902_
				},['message-circle-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_320'],
					Image = L_902_
				},['message-circle-question'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_320'],
					Image = L_902_
				},['message-circle-reply'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_320'],
					Image = L_902_
				},['message-circle-warning'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_320'],
					Image = L_902_
				},['message-circle-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_320'],
					Image = L_902_
				},['message-circle'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_320'],
					Image = L_902_
				},['message-square-code'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_320'],
					Image = L_902_
				},['message-square-dashed'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_320'],
					Image = L_902_
				},['message-square-diff'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_320'],
					Image = L_902_
				},['message-square-dot'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_320'],
					Image = L_902_
				},['message-square-heart'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_320'],
					Image = L_902_
				},['message-square-more'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_320'],
					Image = L_902_
				},['message-square-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_320'],
					Image = L_902_
				},['message-square-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_384'],
					Image = L_902_
				},['message-square-quote'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_384'],
					Image = L_902_
				},['message-square-reply'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_384'],
					Image = L_902_
				},['message-square-share'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_384'],
					Image = L_902_
				},['message-square-text'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_384'],
					Image = L_902_
				},['message-square-warning'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_384'],
					Image = L_902_
				},['message-square-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_384'],
					Image = L_902_
				},['message-square'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_384'],
					Image = L_902_
				},['messages-square'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_384'],
					Image = L_902_
				},['mic-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_384'],
					Image = L_902_
				},['mic-vocal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_384'],
					Image = L_902_
				},mic = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_384'],
					Image = L_902_
				},microscope = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_384'],
					Image = L_902_
				},microwave = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_384'],
					Image = L_902_
				},milestone = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_384'],
					Image = L_902_
				},['milk-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_384'],
					Image = L_902_
				},milk = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_448'],
					Image = L_902_
				},['minimize-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_448'],
					Image = L_902_
				},minimize = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_448'],
					Image = L_902_
				},minus = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_448'],
					Image = L_902_
				},['monitor-check'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_448'],
					Image = L_902_
				},['monitor-dot'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_448'],
					Image = L_902_
				},['monitor-down'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_448'],
					Image = L_902_
				},['monitor-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_448'],
					Image = L_902_
				},['monitor-pause'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_448'],
					Image = L_902_
				},['monitor-play'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_448'],
					Image = L_902_
				},['monitor-smartphone'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_448'],
					Image = L_902_
				},['monitor-speaker'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_448'],
					Image = L_902_
				},['monitor-stop'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_448'],
					Image = L_902_
				},['monitor-up'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_448'],
					Image = L_902_
				},['monitor-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_448'],
					Image = L_902_
				},monitor = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_448'],
					Image = L_902_
				},['moon-star'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_512'],
					Image = L_902_
				},moon = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_512'],
					Image = L_902_
				},['mountain-snow'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_512'],
					Image = L_902_
				},mountain = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_512'],
					Image = L_902_
				},['mouse-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_512'],
					Image = L_902_
				},['mouse-pointer-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_512'],
					Image = L_902_
				},['mouse-pointer-ban'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_512'],
					Image = L_902_
				},['mouse-pointer-click'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_512'],
					Image = L_902_
				},['mouse-pointer'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_512'],
					Image = L_902_
				},mouse = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_512'],
					Image = L_902_
				},['move-3d'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_512'],
					Image = L_902_
				},['move-diagonal-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_512'],
					Image = L_902_
				},['move-diagonal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_512'],
					Image = L_902_
				},['move-down-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_512'],
					Image = L_902_
				},['move-down-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_512'],
					Image = L_902_
				},['move-down'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_512'],
					Image = L_902_
				},['move-horizontal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_576'],
					Image = L_902_
				},['move-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_576'],
					Image = L_902_
				},['move-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_576'],
					Image = L_902_
				},['move-up-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_576'],
					Image = L_902_
				},['move-up-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_576'],
					Image = L_902_
				},['move-up'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_576'],
					Image = L_902_
				},['move-vertical'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_576'],
					Image = L_902_
				},move = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_576'],
					Image = L_902_
				},['music-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_576'],
					Image = L_902_
				},['music-3'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_576'],
					Image = L_902_
				},['music-4'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_576'],
					Image = L_902_
				},music = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_576'],
					Image = L_902_
				},['navigation-2-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_576'],
					Image = L_902_
				},['navigation-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_576'],
					Image = L_902_
				},['navigation-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_576'],
					Image = L_902_
				},navigation = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_576'],
					Image = L_902_
				},network = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_640'],
					Image = L_902_
				},newspaper = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_640'],
					Image = L_902_
				},nfc = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_640'],
					Image = L_902_
				},['notebook-pen'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_640'],
					Image = L_902_
				},['notebook-tabs'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_640'],
					Image = L_902_
				},['notebook-text'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_640'],
					Image = L_902_
				},notebook = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_640'],
					Image = L_902_
				},['notepad-text-dashed'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_640'],
					Image = L_902_
				},['notepad-text'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_640'],
					Image = L_902_
				},['nut-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_640'],
					Image = L_902_
				},nut = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_640'],
					Image = L_902_
				},['octagon-alert'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_640'],
					Image = L_902_
				},['octagon-pause'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_640'],
					Image = L_902_
				},['octagon-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_640'],
					Image = L_902_
				},octagon = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_640'],
					Image = L_902_
				},option = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_640'],
					Image = L_902_
				},orbit = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_704'],
					Image = L_902_
				},origami = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_704'],
					Image = L_902_
				},['package-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_704'],
					Image = L_902_
				},['package-check'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_704'],
					Image = L_902_
				},['package-minus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_704'],
					Image = L_902_
				},['package-open'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_704'],
					Image = L_902_
				},['package-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_704'],
					Image = L_902_
				},['package-search'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_704'],
					Image = L_902_
				},['package-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_704'],
					Image = L_902_
				},package = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_704'],
					Image = L_902_
				},['paint-bucket'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_704'],
					Image = L_902_
				},['paint-roller'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_704'],
					Image = L_902_
				},['paintbrush-vertical'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_704'],
					Image = L_902_
				},paintbrush = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_704'],
					Image = L_902_
				},palette = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_704'],
					Image = L_902_
				},['panel-bottom-close'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_704'],
					Image = L_902_
				},['panel-bottom-dashed'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_768'],
					Image = L_902_
				},['panel-bottom-open'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_768'],
					Image = L_902_
				},['panel-bottom'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_768'],
					Image = L_902_
				},['panel-left-close'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_768'],
					Image = L_902_
				},['panel-left-dashed'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_768'],
					Image = L_902_
				},['panel-left-open'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_768'],
					Image = L_902_
				},['panel-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_768'],
					Image = L_902_
				},['panel-right-close'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_768'],
					Image = L_902_
				},['panel-right-dashed'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_768'],
					Image = L_902_
				},['panel-right-open'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_768'],
					Image = L_902_
				},['panel-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_768'],
					Image = L_902_
				},['panel-top-close'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_768'],
					Image = L_902_
				},['panel-top-dashed'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_768'],
					Image = L_902_
				},['panel-top-open'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_768'],
					Image = L_902_
				},['panel-top'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_768'],
					Image = L_902_
				},['panels-left-bottom'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_768'],
					Image = L_902_
				},['panels-right-bottom'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_832'],
					Image = L_902_
				},['panels-top-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_832'],
					Image = L_902_
				},paperclip = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_832'],
					Image = L_902_
				},parentheses = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_832'],
					Image = L_902_
				},['parking-meter'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_832'],
					Image = L_902_
				},['party-popper'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_832'],
					Image = L_902_
				},pause = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_832'],
					Image = L_902_
				},['paw-print'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_832'],
					Image = L_902_
				},['pc-case'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_832'],
					Image = L_902_
				},['pen-line'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_832'],
					Image = L_902_
				},['pen-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_832'],
					Image = L_902_
				},['pen-tool'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_832'],
					Image = L_902_
				},pen = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_832'],
					Image = L_902_
				},['pencil-line'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_832'],
					Image = L_902_
				},['pencil-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_832'],
					Image = L_902_
				},['pencil-ruler'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_832'],
					Image = L_902_
				},pencil = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_896'],
					Image = L_902_
				},pentagon = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_896'],
					Image = L_902_
				},percent = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_896'],
					Image = L_902_
				},['person-standing'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_896'],
					Image = L_902_
				},['phone-call'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_896'],
					Image = L_902_
				},['phone-forwarded'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_896'],
					Image = L_902_
				},['phone-incoming'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_896'],
					Image = L_902_
				},['phone-missed'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_896'],
					Image = L_902_
				},['phone-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_896'],
					Image = L_902_
				},['phone-outgoing'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_896'],
					Image = L_902_
				},phone = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_896'],
					Image = L_902_
				},pi = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_896'],
					Image = L_902_
				},piano = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_896'],
					Image = L_902_
				},pickaxe = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_896'],
					Image = L_902_
				},['picture-in-picture-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_896'],
					Image = L_902_
				},['picture-in-picture'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_896'],
					Image = L_902_
				},['pie-chart'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_960'],
					Image = L_902_
				},['piggy-bank'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_960'],
					Image = L_902_
				},['pilcrow-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_960'],
					Image = L_902_
				},['pilcrow-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_960'],
					Image = L_902_
				},pilcrow = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_960'],
					Image = L_902_
				},['pill-bottle'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_960'],
					Image = L_902_
				},pill = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_960'],
					Image = L_902_
				},['pin-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_960'],
					Image = L_902_
				},pin = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_960'],
					Image = L_902_
				},pipette = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_960'],
					Image = L_902_
				},pizza = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_960'],
					Image = L_902_
				},['plane-landing'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_960'],
					Image = L_902_
				},['plane-takeoff'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_960'],
					Image = L_902_
				},plane = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_960'],
					Image = L_902_
				},play = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_960'],
					Image = L_902_
				},['plug-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_960'],
					Image = L_902_
				},['plug-zap-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_0'],
					Image = L_903_
				},['plug-zap'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_0'],
					Image = L_903_
				},plug = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_0'],
					Image = L_903_
				},plus = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_0'],
					Image = L_903_
				},['pocket-knife'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_0'],
					Image = L_903_
				},pocket = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_0'],
					Image = L_903_
				},podcast = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_0'],
					Image = L_903_
				},['pointer-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_0'],
					Image = L_903_
				},pointer = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_0'],
					Image = L_903_
				},popcorn = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_0'],
					Image = L_903_
				},popsicle = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_0'],
					Image = L_903_
				},['pound-sterling'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_0'],
					Image = L_903_
				},['power-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_0'],
					Image = L_903_
				},power = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_0'],
					Image = L_903_
				},presentation = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_0'],
					Image = L_903_
				},printer = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_0'],
					Image = L_903_
				},projector = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_64'],
					Image = L_903_
				},proportions = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_64'],
					Image = L_903_
				},puzzle = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_64'],
					Image = L_903_
				},pyramid = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_64'],
					Image = L_903_
				},['qr-code'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_64'],
					Image = L_903_
				},quote = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_64'],
					Image = L_903_
				},rabbit = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_64'],
					Image = L_903_
				},radar = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_64'],
					Image = L_903_
				},radiation = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_64'],
					Image = L_903_
				},radical = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_64'],
					Image = L_903_
				},['radio-receiver'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_64'],
					Image = L_903_
				},['radio-tower'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_64'],
					Image = L_903_
				},radio = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_64'],
					Image = L_903_
				},radius = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_64'],
					Image = L_903_
				},['rail-symbol'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_64'],
					Image = L_903_
				},rainbow = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_64'],
					Image = L_903_
				},rat = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_128'],
					Image = L_903_
				},ratio = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_128'],
					Image = L_903_
				},['receipt-cent'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_128'],
					Image = L_903_
				},['receipt-euro'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_128'],
					Image = L_903_
				},['receipt-indian-rupee'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_128'],
					Image = L_903_
				},['receipt-japanese-yen'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_128'],
					Image = L_903_
				},['receipt-pound-sterling'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_128'],
					Image = L_903_
				},['receipt-russian-ruble'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_128'],
					Image = L_903_
				},['receipt-swiss-franc'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_128'],
					Image = L_903_
				},['receipt-text'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_128'],
					Image = L_903_
				},receipt = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_128'],
					Image = L_903_
				},['rectangle-ellipsis'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_128'],
					Image = L_903_
				},['rectangle-horizontal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_128'],
					Image = L_903_
				},['rectangle-vertical'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_128'],
					Image = L_903_
				},recycle = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_128'],
					Image = L_903_
				},['redo-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_128'],
					Image = L_903_
				},['redo-dot'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_192'],
					Image = L_903_
				},redo = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_192'],
					Image = L_903_
				},['refresh-ccw-dot'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_192'],
					Image = L_903_
				},['refresh-ccw'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_192'],
					Image = L_903_
				},['refresh-cw-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_192'],
					Image = L_903_
				},['refresh-cw'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_192'],
					Image = L_903_
				},refrigerator = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_192'],
					Image = L_903_
				},regex = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_192'],
					Image = L_903_
				},['remove-formatting'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_192'],
					Image = L_903_
				},['repeat-1'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_192'],
					Image = L_903_
				},['repeat-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_192'],
					Image = L_903_
				},['repeat'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_192'],
					Image = L_903_
				},['replace-all'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_192'],
					Image = L_903_
				},replace = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_192'],
					Image = L_903_
				},['reply-all'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_192'],
					Image = L_903_
				},reply = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_192'],
					Image = L_903_
				},rewind = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_256'],
					Image = L_903_
				},ribbon = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_256'],
					Image = L_903_
				},rocket = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_256'],
					Image = L_903_
				},['rocking-chair'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_256'],
					Image = L_903_
				},['roller-coaster'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_256'],
					Image = L_903_
				},['rotate-3d'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_256'],
					Image = L_903_
				},['rotate-ccw-square'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_256'],
					Image = L_903_
				},['rotate-ccw'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_256'],
					Image = L_903_
				},['rotate-cw-square'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_256'],
					Image = L_903_
				},['rotate-cw'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_256'],
					Image = L_903_
				},['route-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_256'],
					Image = L_903_
				},route = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_256'],
					Image = L_903_
				},router = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_256'],
					Image = L_903_
				},['rows-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_256'],
					Image = L_903_
				},['rows-3'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_256'],
					Image = L_903_
				},['rows-4'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_256'],
					Image = L_903_
				},rss = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_320'],
					Image = L_903_
				},ruler = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_320'],
					Image = L_903_
				},['russian-ruble'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_320'],
					Image = L_903_
				},sailboat = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_320'],
					Image = L_903_
				},salad = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_320'],
					Image = L_903_
				},sandwich = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_320'],
					Image = L_903_
				},['satellite-dish'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_320'],
					Image = L_903_
				},satellite = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_320'],
					Image = L_903_
				},['save-all'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_320'],
					Image = L_903_
				},save = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_320'],
					Image = L_903_
				},['scale-3d'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_320'],
					Image = L_903_
				},scale = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_320'],
					Image = L_903_
				},scaling = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_320'],
					Image = L_903_
				},['scan-barcode'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_320'],
					Image = L_903_
				},['scan-eye'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_320'],
					Image = L_903_
				},['scan-face'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_320'],
					Image = L_903_
				},['scan-line'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_384'],
					Image = L_903_
				},['scan-search'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_384'],
					Image = L_903_
				},['scan-text'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_384'],
					Image = L_903_
				},scan = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_384'],
					Image = L_903_
				},['scatter-chart'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_384'],
					Image = L_903_
				},school = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_384'],
					Image = L_903_
				},['scissors-line-dashed'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_384'],
					Image = L_903_
				},scissors = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_384'],
					Image = L_903_
				},['screen-share-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_384'],
					Image = L_903_
				},['screen-share'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_384'],
					Image = L_903_
				},['scroll-text'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_384'],
					Image = L_903_
				},scroll = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_384'],
					Image = L_903_
				},['search-check'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_384'],
					Image = L_903_
				},['search-code'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_384'],
					Image = L_903_
				},['search-slash'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_384'],
					Image = L_903_
				},['search-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_384'],
					Image = L_903_
				},search = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_448'],
					Image = L_903_
				},section = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_448'],
					Image = L_903_
				},['send-horizontal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_448'],
					Image = L_903_
				},['send-to-back'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_448'],
					Image = L_903_
				},send = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_448'],
					Image = L_903_
				},['separator-horizontal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_448'],
					Image = L_903_
				},['separator-vertical'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_448'],
					Image = L_903_
				},['server-cog'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_448'],
					Image = L_903_
				},['server-crash'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_448'],
					Image = L_903_
				},['server-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_448'],
					Image = L_903_
				},server = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_448'],
					Image = L_903_
				},['settings-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_448'],
					Image = L_903_
				},settings = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_448'],
					Image = L_903_
				},shapes = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_448'],
					Image = L_903_
				},['share-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_448'],
					Image = L_903_
				},share = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_448'],
					Image = L_903_
				},sheet = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_512'],
					Image = L_903_
				},shell = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_512'],
					Image = L_903_
				},['shield-alert'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_512'],
					Image = L_903_
				},['shield-ban'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_512'],
					Image = L_903_
				},['shield-check'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_512'],
					Image = L_903_
				},['shield-ellipsis'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_512'],
					Image = L_903_
				},['shield-half'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_512'],
					Image = L_903_
				},['shield-minus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_512'],
					Image = L_903_
				},['shield-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_512'],
					Image = L_903_
				},['shield-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_512'],
					Image = L_903_
				},['shield-question'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_512'],
					Image = L_903_
				},['shield-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_512'],
					Image = L_903_
				},shield = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_512'],
					Image = L_903_
				},['ship-wheel'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_512'],
					Image = L_903_
				},ship = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_512'],
					Image = L_903_
				},shirt = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_512'],
					Image = L_903_
				},['shopping-bag'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_576'],
					Image = L_903_
				},['shopping-basket'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_576'],
					Image = L_903_
				},['shopping-cart'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_576'],
					Image = L_903_
				},shovel = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_576'],
					Image = L_903_
				},['shower-head'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_576'],
					Image = L_903_
				},shrink = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_576'],
					Image = L_903_
				},shrub = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_576'],
					Image = L_903_
				},shuffle = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_576'],
					Image = L_903_
				},sigma = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_576'],
					Image = L_903_
				},['signal-high'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_576'],
					Image = L_903_
				},['signal-low'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_576'],
					Image = L_903_
				},['signal-medium'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_576'],
					Image = L_903_
				},['signal-zero'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_576'],
					Image = L_903_
				},signal = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_576'],
					Image = L_903_
				},['signpost-big'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_576'],
					Image = L_903_
				},signpost = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_576'],
					Image = L_903_
				},siren = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_640'],
					Image = L_903_
				},['skip-back'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_640'],
					Image = L_903_
				},['skip-forward'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_640'],
					Image = L_903_
				},skull = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_640'],
					Image = L_903_
				},slack = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_640'],
					Image = L_903_
				},slash = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_640'],
					Image = L_903_
				},slice = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_640'],
					Image = L_903_
				},['sliders-horizontal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_640'],
					Image = L_903_
				},['sliders-vertical'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_640'],
					Image = L_903_
				},['smartphone-charging'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_640'],
					Image = L_903_
				},['smartphone-nfc'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_640'],
					Image = L_903_
				},smartphone = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_640'],
					Image = L_903_
				},['smile-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_640'],
					Image = L_903_
				},smile = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_640'],
					Image = L_903_
				},snail = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_640'],
					Image = L_903_
				},snowflake = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_640'],
					Image = L_903_
				},sofa = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_704'],
					Image = L_903_
				},soup = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_704'],
					Image = L_903_
				},space = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_704'],
					Image = L_903_
				},spade = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_704'],
					Image = L_903_
				},sparkle = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_704'],
					Image = L_903_
				},sparkles = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_704'],
					Image = L_903_
				},speaker = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_704'],
					Image = L_903_
				},speech = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_704'],
					Image = L_903_
				},['spell-check-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_704'],
					Image = L_903_
				},['spell-check'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_704'],
					Image = L_903_
				},spline = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_704'],
					Image = L_903_
				},split = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_704'],
					Image = L_903_
				},['spray-can'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_704'],
					Image = L_903_
				},sprout = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_704'],
					Image = L_903_
				},['square-activity'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_704'],
					Image = L_903_
				},['square-arrow-down-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_704'],
					Image = L_903_
				},['square-arrow-down-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_768'],
					Image = L_903_
				},['square-arrow-down'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_768'],
					Image = L_903_
				},['square-arrow-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_768'],
					Image = L_903_
				},['square-arrow-out-down-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_768'],
					Image = L_903_
				},['square-arrow-out-down-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_768'],
					Image = L_903_
				},['square-arrow-out-up-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_768'],
					Image = L_903_
				},['square-arrow-out-up-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_768'],
					Image = L_903_
				},['square-arrow-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_768'],
					Image = L_903_
				},['square-arrow-up-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_768'],
					Image = L_903_
				},['square-arrow-up-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_768'],
					Image = L_903_
				},['square-arrow-up'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_768'],
					Image = L_903_
				},['square-asterisk'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_768'],
					Image = L_903_
				},['square-bottom-dashed-scissors'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_768'],
					Image = L_903_
				},['square-check-big'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_768'],
					Image = L_903_
				},['square-check'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_768'],
					Image = L_903_
				},['square-chevron-down'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_768'],
					Image = L_903_
				},['square-chevron-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_832'],
					Image = L_903_
				},['square-chevron-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_832'],
					Image = L_903_
				},['square-chevron-up'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_832'],
					Image = L_903_
				},['square-code'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_832'],
					Image = L_903_
				},['square-dashed-bottom-code'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_832'],
					Image = L_903_
				},['square-dashed-bottom'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_832'],
					Image = L_903_
				},['square-dashed-kanban'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_832'],
					Image = L_903_
				},['square-dashed-mouse-pointer'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_832'],
					Image = L_903_
				},['square-divide'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_832'],
					Image = L_903_
				},['square-dot'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_832'],
					Image = L_903_
				},['square-equal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_832'],
					Image = L_903_
				},['square-function'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_832'],
					Image = L_903_
				},['square-gantt-chart'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_832'],
					Image = L_903_
				},['square-kanban'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_832'],
					Image = L_903_
				},['square-library'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_832'],
					Image = L_903_
				},['square-m'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_832'],
					Image = L_903_
				},['square-menu'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_896'],
					Image = L_903_
				},['square-minus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_896'],
					Image = L_903_
				},['square-mouse-pointer'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_896'],
					Image = L_903_
				},['square-parking-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_896'],
					Image = L_903_
				},['square-parking'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_896'],
					Image = L_903_
				},['square-pen'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_896'],
					Image = L_903_
				},['square-percent'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_896'],
					Image = L_903_
				},['square-pi'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_896'],
					Image = L_903_
				},['square-pilcrow'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_896'],
					Image = L_903_
				},['square-play'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_896'],
					Image = L_903_
				},['square-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_896'],
					Image = L_903_
				},['square-power'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_896'],
					Image = L_903_
				},['square-radical'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_896'],
					Image = L_903_
				},['square-scissors'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_896'],
					Image = L_903_
				},['square-sigma'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_896'],
					Image = L_903_
				},['square-slash'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_896'],
					Image = L_903_
				},['square-split-horizontal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_960'],
					Image = L_903_
				},['square-split-vertical'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_960'],
					Image = L_903_
				},['square-stack'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_960'],
					Image = L_903_
				},['square-terminal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_960'],
					Image = L_903_
				},['square-user-round'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_960'],
					Image = L_903_
				},['square-user'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_960'],
					Image = L_903_
				},['square-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_960'],
					Image = L_903_
				},square = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_960'],
					Image = L_903_
				},squircle = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_960'],
					Image = L_903_
				},squirrel = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_960'],
					Image = L_903_
				},stamp = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_960'],
					Image = L_903_
				},['star-half'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_960'],
					Image = L_903_
				},['star-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_960'],
					Image = L_903_
				},star = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_960'],
					Image = L_903_
				},['step-back'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_960'],
					Image = L_903_
				},['step-forward'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_960'],
					Image = L_903_
				},stethoscope = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_0'],
					Image = L_904_
				},sticker = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_0'],
					Image = L_904_
				},['sticky-note'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_0'],
					Image = L_904_
				},store = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_0'],
					Image = L_904_
				},['stretch-horizontal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_0'],
					Image = L_904_
				},['stretch-vertical'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_0'],
					Image = L_904_
				},strikethrough = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_0'],
					Image = L_904_
				},subscript = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_0'],
					Image = L_904_
				},['sun-dim'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_0'],
					Image = L_904_
				},['sun-medium'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_0'],
					Image = L_904_
				},['sun-moon'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_0'],
					Image = L_904_
				},['sun-snow'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_0'],
					Image = L_904_
				},sun = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_0'],
					Image = L_904_
				},sunrise = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_0'],
					Image = L_904_
				},sunset = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_0'],
					Image = L_904_
				},superscript = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_0'],
					Image = L_904_
				},['swatch-book'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_64'],
					Image = L_904_
				},['swiss-franc'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_64'],
					Image = L_904_
				},['switch-camera'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_64'],
					Image = L_904_
				},sword = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_64'],
					Image = L_904_
				},swords = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_64'],
					Image = L_904_
				},syringe = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_64'],
					Image = L_904_
				},['table-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_64'],
					Image = L_904_
				},['table-cells-merge'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_64'],
					Image = L_904_
				},['table-cells-split'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_64'],
					Image = L_904_
				},['table-columns-split'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_64'],
					Image = L_904_
				},['table-properties'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_64'],
					Image = L_904_
				},['table-rows-split'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_64'],
					Image = L_904_
				},table = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_64'],
					Image = L_904_
				},['tablet-smartphone'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_64'],
					Image = L_904_
				},tablet = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_64'],
					Image = L_904_
				},tablets = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_64'],
					Image = L_904_
				},tag = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_128'],
					Image = L_904_
				},tags = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_128'],
					Image = L_904_
				},['tally-1'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_128'],
					Image = L_904_
				},['tally-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_128'],
					Image = L_904_
				},['tally-3'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_128'],
					Image = L_904_
				},['tally-4'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_128'],
					Image = L_904_
				},['tally-5'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_128'],
					Image = L_904_
				},tangent = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_128'],
					Image = L_904_
				},target = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_128'],
					Image = L_904_
				},telescope = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_128'],
					Image = L_904_
				},['tent-tree'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_128'],
					Image = L_904_
				},tent = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_128'],
					Image = L_904_
				},terminal = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_128'],
					Image = L_904_
				},['test-tube-diagonal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_128'],
					Image = L_904_
				},['test-tube'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_128'],
					Image = L_904_
				},['test-tubes'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_128'],
					Image = L_904_
				},['text-cursor-input'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_192'],
					Image = L_904_
				},['text-cursor'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_192'],
					Image = L_904_
				},['text-quote'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_192'],
					Image = L_904_
				},['text-search'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_192'],
					Image = L_904_
				},['text-select'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_192'],
					Image = L_904_
				},text = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_192'],
					Image = L_904_
				},theater = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_192'],
					Image = L_904_
				},['thermometer-snowflake'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_192'],
					Image = L_904_
				},['thermometer-sun'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_192'],
					Image = L_904_
				},thermometer = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_192'],
					Image = L_904_
				},['thumbs-down'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_192'],
					Image = L_904_
				},['thumbs-up'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_192'],
					Image = L_904_
				},['ticket-check'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_192'],
					Image = L_904_
				},['ticket-minus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_192'],
					Image = L_904_
				},['ticket-percent'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_192'],
					Image = L_904_
				},['ticket-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_192'],
					Image = L_904_
				},['ticket-slash'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_256'],
					Image = L_904_
				},['ticket-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_256'],
					Image = L_904_
				},ticket = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_256'],
					Image = L_904_
				},['timer-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_256'],
					Image = L_904_
				},['timer-reset'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_256'],
					Image = L_904_
				},timer = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_256'],
					Image = L_904_
				},['toggle-left'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_256'],
					Image = L_904_
				},['toggle-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_256'],
					Image = L_904_
				},tornado = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_256'],
					Image = L_904_
				},torus = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_256'],
					Image = L_904_
				},['touchpad-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_256'],
					Image = L_904_
				},touchpad = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_256'],
					Image = L_904_
				},['tower-control'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_256'],
					Image = L_904_
				},['toy-brick'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_256'],
					Image = L_904_
				},tractor = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_256'],
					Image = L_904_
				},['traffic-cone'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_256'],
					Image = L_904_
				},['train-front-tunnel'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_320'],
					Image = L_904_
				},['train-front'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_320'],
					Image = L_904_
				},['train-track'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_320'],
					Image = L_904_
				},['tram-front'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_320'],
					Image = L_904_
				},['trash-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_320'],
					Image = L_904_
				},trash = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_320'],
					Image = L_904_
				},['tree-deciduous'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_320'],
					Image = L_904_
				},['tree-palm'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_320'],
					Image = L_904_
				},['tree-pine'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_320'],
					Image = L_904_
				},trees = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_320'],
					Image = L_904_
				},trello = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_320'],
					Image = L_904_
				},['trending-down'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_320'],
					Image = L_904_
				},['trending-up'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_320'],
					Image = L_904_
				},['triangle-alert'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_320'],
					Image = L_904_
				},['triangle-right'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_320'],
					Image = L_904_
				},triangle = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_320'],
					Image = L_904_
				},trophy = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_384'],
					Image = L_904_
				},truck = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_384'],
					Image = L_904_
				},turtle = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_384'],
					Image = L_904_
				},['tv-minimal-play'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_384'],
					Image = L_904_
				},['tv-minimal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_384'],
					Image = L_904_
				},tv = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_384'],
					Image = L_904_
				},twitch = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_384'],
					Image = L_904_
				},twitter = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_384'],
					Image = L_904_
				},type = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_384'],
					Image = L_904_
				},['umbrella-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_384'],
					Image = L_904_
				},umbrella = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_384'],
					Image = L_904_
				},underline = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_384'],
					Image = L_904_
				},['undo-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_384'],
					Image = L_904_
				},['undo-dot'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_384'],
					Image = L_904_
				},undo = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_384'],
					Image = L_904_
				},['unfold-horizontal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_384'],
					Image = L_904_
				},['unfold-vertical'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_448'],
					Image = L_904_
				},ungroup = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_448'],
					Image = L_904_
				},university = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_448'],
					Image = L_904_
				},['unlink-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_448'],
					Image = L_904_
				},unlink = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_448'],
					Image = L_904_
				},unplug = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_448'],
					Image = L_904_
				},upload = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_448'],
					Image = L_904_
				},usb = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_448'],
					Image = L_904_
				},['user-check'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_448'],
					Image = L_904_
				},['user-cog'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_448'],
					Image = L_904_
				},['user-minus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_448'],
					Image = L_904_
				},['user-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_448'],
					Image = L_904_
				},['user-round-check'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_448'],
					Image = L_904_
				},['user-round-cog'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_448'],
					Image = L_904_
				},['user-round-minus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_448'],
					Image = L_904_
				},['user-round-plus'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_448'],
					Image = L_904_
				},['user-round-search'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_512'],
					Image = L_904_
				},['user-round-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_512'],
					Image = L_904_
				},['user-round'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_512'],
					Image = L_904_
				},['user-search'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_512'],
					Image = L_904_
				},['user-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_512'],
					Image = L_904_
				},user = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_512'],
					Image = L_904_
				},['users-round'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_512'],
					Image = L_904_
				},users = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_512'],
					Image = L_904_
				},['utensils-crossed'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_512'],
					Image = L_904_
				},utensils = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_512'],
					Image = L_904_
				},['utility-pole'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_512'],
					Image = L_904_
				},variable = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_512'],
					Image = L_904_
				},vault = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_512'],
					Image = L_904_
				},vegan = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_512'],
					Image = L_904_
				},['venetian-mask'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_512'],
					Image = L_904_
				},['vibrate-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_512'],
					Image = L_904_
				},vibrate = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_576'],
					Image = L_904_
				},['video-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_576'],
					Image = L_904_
				},video = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_576'],
					Image = L_904_
				},videotape = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_576'],
					Image = L_904_
				},view = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_576'],
					Image = L_904_
				},voicemail = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_576'],
					Image = L_904_
				},['volume-1'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_576'],
					Image = L_904_
				},['volume-2'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_576'],
					Image = L_904_
				},['volume-x'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_576'],
					Image = L_904_
				},volume = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_576'],
					Image = L_904_
				},vote = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_576'],
					Image = L_904_
				},['wallet-cards'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_576'],
					Image = L_904_
				},['wallet-minimal'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_576'],
					Image = L_904_
				},wallet = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_576'],
					Image = L_904_
				},wallpaper = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_576'],
					Image = L_904_
				},['wand-sparkles'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_576'],
					Image = L_904_
				},wand = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_640'],
					Image = L_904_
				},warehouse = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_640'],
					Image = L_904_
				},['washing-machine'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_640'],
					Image = L_904_
				},watch = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_640'],
					Image = L_904_
				},waves = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_640'],
					Image = L_904_
				},waypoints = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_640'],
					Image = L_904_
				},webcam = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_640'],
					Image = L_904_
				},['webhook-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_640'],
					Image = L_904_
				},webhook = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_640'],
					Image = L_904_
				},weight = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_640'],
					Image = L_904_
				},['wheat-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_640'],
					Image = L_904_
				},wheat = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_640'],
					Image = L_904_
				},['whole-word'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['768_640'],
					Image = L_904_
				},['wifi-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['832_640'],
					Image = L_904_
				},wifi = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['896_640'],
					Image = L_904_
				},wind = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['960_640'],
					Image = L_904_
				},['wine-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['0_704'],
					Image = L_904_
				},wine = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['64_704'],
					Image = L_904_
				},workflow = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['128_704'],
					Image = L_904_
				},worm = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['192_704'],
					Image = L_904_
				},['wrap-text'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['256_704'],
					Image = L_904_
				},wrench = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['320_704'],
					Image = L_904_
				},x = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['384_704'],
					Image = L_904_
				},youtube = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['448_704'],
					Image = L_904_
				},['zap-off'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['512_704'],
					Image = L_904_
				},zap = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['576_704'],
					Image = L_904_
				},['zoom-in'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['640_704'],
					Image = L_904_
				},['zoom-out'] = {
					ImageRectSize = L_905_['64_64'],
					ImageRectOffset = L_905_['704_704'],
					Image = L_904_
				}}
		end)()
	end,
	[30] = function()
		local L_927_, L_928_, L_929_ = L_1_(30)
		return (function(...)
			return (function()
				local L_930_ = {}
				for L_931_forvar0, L_932_forvar1 in next, L_928_:GetChildren() do
					if not L_932_forvar1.Name:find'.spec' then
						task.spawn(function()
							L_930_[L_932_forvar1.Name] = L_929_(L_932_forvar1)
						end)
					end
				end
				return L_930_
			end)()
		end)()
	end,
	[31] = function()
		local L_933_, L_934_, L_935_ = L_1_(31)
		return (function(...)
			local L_936_, L_937_, L_938_, L_939_ = game:GetService'RunService', L_935_(L_934_.Parent.Signal), function()
			end, {}
			L_939_.__index = L_939_
			function L_939_.new()
				return setmetatable({
					_onStep = L_937_.new(),
					_onStart = L_937_.new(),
					_onComplete = L_937_.new()
				}, L_939_)
			end
			function L_939_.onStep(L_940_arg0, L_941_arg1)
				return L_940_arg0._onStep:connect(L_941_arg1)
			end
			function L_939_.onStart(L_942_arg0, L_943_arg1)
				return L_942_arg0._onStart:connect(L_943_arg1)
			end
			function L_939_.onComplete(L_944_arg0, L_945_arg1)
				return L_944_arg0._onComplete:connect(L_945_arg1)
			end
			function L_939_.start(L_946_arg0)
				if not L_946_arg0._connection then
					L_946_arg0._connection = L_936_.RenderStepped:Connect(function(L_947_arg0)
						L_946_arg0:step(L_947_arg0)
					end)
				end
			end
			function L_939_.stop(L_948_arg0)
				if L_948_arg0._connection then
					L_948_arg0._connection:Disconnect()
					L_948_arg0._connection = nil
				end
			end
			L_939_.destroy = L_939_.stop
			L_939_.step = L_938_
			L_939_.getValue = L_938_
			L_939_.setGoal = L_938_
			function L_939_.__tostring(L_949_arg0)
				return 'Motor'
			end
			return L_939_
		end)()
	end,
	[32] = function()
		local L_950_, L_951_, L_952_ = L_1_(32)
		return (function(...)
			return function()
				local L_953_, L_954_ = game:GetService'RunService', L_952_(L_951_.Parent.BaseMotor)
				describe('connection management', function()
					local L_955_ = L_954_.new()
					it('should hook up connections on :start()', function()
						L_955_:start()
						expect(typeof(L_955_._connection)).to.equal'RBXScriptConnection'
					end)
					it('should remove connections on :stop() or :destroy()', function()
						L_955_:stop()
						expect(L_955_._connection).to.equal(nil)
					end)
				end)
				it('should call :step() with deltaTime', function()
					local L_956_, L_957_ = (L_954_.new())
					function L_956_.step(L_959_arg0, ...)
						L_957_ = {
							...
						}
						L_956_:stop()
					end
					L_956_:start()
					local L_958_ = L_953_.RenderStepped:Wait()
					L_953_.RenderStepped:Wait()
					expect(L_957_).to.be.ok()
					expect(L_957_[1]).to.equal(L_958_)
				end)
			end
		end)()
	end,
	[33] = function()
		local L_960_, L_961_, L_962_ = L_1_(33)
		return (function(...)
			local L_963_, L_964_, L_965_ = L_962_(L_961_.Parent.BaseMotor), L_962_(L_961_.Parent.SingleMotor), L_962_(L_961_.Parent.isMotor)
			local L_966_ = setmetatable({}, L_963_)
			L_966_.__index = L_966_
			local L_967_ = function(L_968_arg0)
				if L_965_(L_968_arg0) then
					return L_968_arg0
				end
				local L_969_ = typeof(L_968_arg0)
				if L_969_ == 'number' then
					return L_964_.new(L_968_arg0, false)
				elseif L_969_ == 'table' then
					return L_966_.new(L_968_arg0, false)
				end
				error(('Unable to convert %q to motor; type %s is unsupported'):format(L_968_arg0, L_969_), 2)
			end
			function L_966_.new(L_970_arg0, L_971_arg1)
				assert(L_970_arg0, 'Missing argument #1: initialValues')
				assert(typeof(L_970_arg0) == 'table', 'initialValues must be a table!')
				assert(not L_970_arg0.step, [[initialValues contains disallowed property "step". Did you mean to put a table of values here?]])
				local L_972_ = setmetatable(L_963_.new(), L_966_)
				if L_971_arg1 ~= nil then
					L_972_._useImplicitConnections = L_971_arg1
				else
					L_972_._useImplicitConnections = true
				end
				L_972_._complete = true
				L_972_._motors = {}
				for L_973_forvar0, L_974_forvar1 in pairs(L_970_arg0) do
					L_972_._motors[L_973_forvar0] = L_967_(L_974_forvar1)
				end
				return L_972_
			end
			function L_966_.step(L_975_arg0, L_976_arg1)
				if L_975_arg0._complete then
					return true
				end
				local L_977_ = true
				for L_978_forvar0, L_979_forvar1 in pairs(L_975_arg0._motors) do
					local L_980_ = L_979_forvar1:step(L_976_arg1)
					if not L_980_ then
						L_977_ = false
					end
				end
				L_975_arg0._onStep:fire(L_975_arg0:getValue())
				if L_977_ then
					if L_975_arg0._useImplicitConnections then
						L_975_arg0:stop()
					end
					L_975_arg0._complete = true
					L_975_arg0._onComplete:fire()
				end
				return L_977_
			end
			function L_966_.setGoal(L_981_arg0, L_982_arg1)
				assert(not L_982_arg1.step, [[goals contains disallowed property "step". Did you mean to put a table of goals here?]])
				L_981_arg0._complete = false
				L_981_arg0._onStart:fire()
				for L_983_forvar0, L_984_forvar1 in pairs(L_982_arg1) do
					local L_985_ = assert(L_981_arg0._motors[L_983_forvar0], ('Unknown motor for key %s'):format(L_983_forvar0))
					L_985_:setGoal(L_984_forvar1)
				end
				if L_981_arg0._useImplicitConnections then
					L_981_arg0:start()
				end
			end
			function L_966_.getValue(L_986_arg0)
				local L_987_ = {}
				for L_988_forvar0, L_989_forvar1 in pairs(L_986_arg0._motors) do
					L_987_[L_988_forvar0] = L_989_forvar1:getValue()
				end
				return L_987_
			end
			function L_966_.__tostring(L_990_arg0)
				return 'Motor(Group)'
			end
			return L_966_
		end)()
	end,
	[34] = function()
		local L_991_, L_992_, L_993_ = L_1_(34)
		return (function(...)
			return function()
				local L_994_, L_995_, L_996_ = L_993_(L_992_.Parent.GroupMotor), L_993_(L_992_.Parent.Instant), L_993_(L_992_.Parent.Spring)
				it('should complete when all child motors are complete', function()
					local L_997_ = L_994_.new({
						A = 1,
						B = 2
					}, false)
					expect(L_997_._complete).to.equal(true)
					L_997_:setGoal{
						A = L_995_.new(3),
						B = L_996_.new(4, {
							frequency = 7.5,
							dampingRatio = 1
						})
					}
					expect(L_997_._complete).to.equal(false)
					L_997_:step(1.6666666666666665E-2)
					expect(L_997_._complete).to.equal(false)
					for L_998_forvar0 = 1, 30 do
						L_997_:step(1.6666666666666665E-2)
					end
					expect(L_997_._complete).to.equal(true)
				end)
				it('should start when the goal is set', function()
					local L_999_, L_1000_ = L_994_.new({
						A = 0
					}, false), false
					L_999_:onStart(function()
						L_1000_ = not L_1000_
					end)
					L_999_:setGoal{
						A = L_995_.new(1)
					}
					expect(L_1000_).to.equal(true)
					L_999_:setGoal{
						A = L_995_.new(1)
					}
					expect(L_1000_).to.equal(false)
				end)
				it('should properly return all values', function()
					local L_1001_ = L_994_.new({
						A = 1,
						B = 2
					}, false)
					local L_1002_ = L_1001_:getValue()
					expect(L_1002_.A).to.equal(1)
					expect(L_1002_.B).to.equal(2)
				end)
				it('should error when a goal is given to GroupMotor.new', function()
					local L_1003_ = pcall(function()
						L_994_.new(L_995_.new(0))
					end)
					expect(L_1003_).to.equal(false)
				end)
				it([[should error when a single goal is provided to GroupMotor:step]], function()
					local L_1004_ = pcall(function()
						L_994_.new{
							a = 1
						}:setGoal(L_995_.new(0))
					end)
					expect(L_1004_).to.equal(false)
				end)
			end
		end)()
	end,
	[35] = function()
		L_1_(35)
		return (function(...)
			local L_1005_ = {}
			L_1005_.__index = L_1005_
			function L_1005_.new(L_1006_arg0)
				return setmetatable({
					_targetValue = L_1006_arg0
				}, L_1005_)
			end
			function L_1005_.step(L_1007_arg0)
				return {
					complete = true,
					value = L_1007_arg0._targetValue
				}
			end
			return L_1005_
		end)()
	end,
	[36] = function()
		local L_1008_, L_1009_, L_1010_ = L_1_(36)
		return (function(...)
			return function()
				local L_1011_ = L_1010_(L_1009_.Parent.Instant)
				it('should return a completed state with the provided value', function()
					local L_1012_ = L_1011_.new(1.23)
					local L_1013_ = L_1012_:step(0.1, {
						value = 0,
						complete = false
					})
					expect(L_1013_.complete).to.equal(true)
					expect(L_1013_.value).to.equal(1.23)
				end)
			end
		end)()
	end,
	[37] = function()
		L_1_(37)
		return (function(...)
			local L_1014_ = {}
			L_1014_.__index = L_1014_
			function L_1014_.new(L_1015_arg0, L_1016_arg1)
				assert(L_1015_arg0, 'Missing argument #1: targetValue')
				L_1016_arg1 = L_1016_arg1 or {}
				return setmetatable({
					_targetValue = L_1015_arg0,
					_velocity = L_1016_arg1.velocity or 1
				}, L_1014_)
			end
			function L_1014_.step(L_1017_arg0, L_1018_arg1, L_1019_arg2)
				local L_1020_, L_1021_, L_1022_ = L_1018_arg1.value, L_1017_arg0._velocity, L_1017_arg0._targetValue
				local L_1023_ = L_1019_arg2 * L_1021_
				local L_1024_ = L_1023_ >= math.abs(L_1022_ - L_1020_)
				L_1020_ = L_1020_ + L_1023_ * (L_1022_ > L_1020_ and 1 or -1)
				if L_1024_ then
					L_1020_ = L_1017_arg0._targetValue
					L_1021_ = 0
				end
				return {
					complete = L_1024_,
					value = L_1020_,
					velocity = L_1021_
				}
			end
			return L_1014_
		end)()
	end,
	[38] = function()
		local L_1025_, L_1026_, L_1027_ = L_1_(38)
		return (function(...)
			return function()
				local L_1028_, L_1029_ = L_1027_(L_1026_.Parent.SingleMotor), L_1027_(L_1026_.Parent.Linear)
				describe('completed state', function()
					local L_1030_, L_1031_ = L_1028_.new(0, false), L_1029_.new(1, {
						velocity = 1
					})
					L_1030_:setGoal(L_1031_)
					for L_1032_forvar0 = 1, 60 do
						L_1030_:step(1.6666666666666665E-2)
					end
					it('should complete', function()
						expect(L_1030_._state.complete).to.equal(true)
					end)
					it('should be exactly the goal value when completed', function()
						expect(L_1030_._state.value).to.equal(1)
					end)
				end)
				describe('uncompleted state', function()
					local L_1033_, L_1034_ = L_1028_.new(0, false), L_1029_.new(1, {
						velocity = 1
					})
					L_1033_:setGoal(L_1034_)
					for L_1035_forvar0 = 1, 59 do
						L_1033_:step(1.6666666666666665E-2)
					end
					it('should be uncomplete', function()
						expect(L_1033_._state.complete).to.equal(false)
					end)
				end)
				describe('negative velocity', function()
					local L_1036_, L_1037_ = L_1028_.new(1, false), L_1029_.new(0, {
						velocity = 1
					})
					L_1036_:setGoal(L_1037_)
					for L_1038_forvar0 = 1, 60 do
						L_1036_:step(1.6666666666666665E-2)
					end
					it('should complete', function()
						expect(L_1036_._state.complete).to.equal(true)
					end)
					it('should be exactly the goal value when completed', function()
						expect(L_1036_._state.value).to.equal(0)
					end)
				end)
			end
		end)()
	end,
	[39] = function()
		L_1_(39)
		return (function(...)
			local L_1039_ = {}
			L_1039_.__index = L_1039_
			function L_1039_.new(L_1041_arg0, L_1042_arg1)
				return setmetatable({
					signal = L_1041_arg0,
					connected = true,
					_handler = L_1042_arg1
				}, L_1039_)
			end
			function L_1039_.disconnect(L_1043_arg0)
				if L_1043_arg0.connected then
					L_1043_arg0.connected = false
					for L_1044_forvar0, L_1045_forvar1 in pairs(L_1043_arg0.signal._connections) do
						if L_1045_forvar1 == L_1043_arg0 then
							table.remove(L_1043_arg0.signal._connections, L_1044_forvar0)
							return
						end
					end
				end
			end
			local L_1040_ = setmetatable({}, {
				__index = function(L_1046_arg0, L_1047_arg1)
					return rawget(L_1046_arg0, typeof(L_1047_arg1) == 'string' and L_1047_arg1:lower() or L_1047_arg1)
				end
			})
			L_1040_.__index = L_1040_
			function L_1040_.new()
				return setmetatable({
					_connections = {},
					_threads = {}
				}, L_1040_)
			end
			function L_1040_.fire(L_1048_arg0, ...)
				for L_1049_forvar0, L_1050_forvar1 in pairs(L_1048_arg0._connections) do
					L_1050_forvar1._handler(...)
				end
				for L_1051_forvar0, L_1052_forvar1 in pairs(L_1048_arg0._threads) do
					coroutine.resume(L_1052_forvar1, ...)
				end
				L_1048_arg0._threads = {}
			end
			function L_1040_.connect(L_1053_arg0, L_1054_arg1)
				local L_1055_ = L_1039_.new(L_1053_arg0, L_1054_arg1)
				table.insert(L_1053_arg0._connections, L_1055_)
				return L_1055_
			end
			function L_1040_.wait(L_1056_arg0)
				table.insert(L_1056_arg0._threads, coroutine.running())
				return coroutine.yield()
			end
			return L_1040_
		end)()
	end,
	[40] = function()
		local L_1057_, L_1058_, L_1059_ = L_1_(40)
		return (function(...)
			return function()
				local L_1060_ = L_1059_(L_1058_.Parent.Signal)
				it('should invoke all connections, instantly', function()
					local L_1061_, L_1062_, L_1063_ = (L_1060_.new())
					L_1061_:connect(function(L_1064_arg0)
						L_1062_ = L_1064_arg0
					end)
					L_1061_:connect(function(L_1065_arg0)
						L_1063_ = L_1065_arg0
					end)
					L_1061_:fire'hello'
					expect(L_1062_).to.equal'hello'
					expect(L_1063_).to.equal'hello'
				end)
				it('should return values when :wait() is called', function()
					local L_1066_ = L_1060_.new()
					spawn(function()
						L_1066_:fire(123, 'hello')
					end)
					local L_1067_, L_1068_ = L_1066_:wait()
					expect(L_1067_).to.equal(123)
					expect(L_1068_).to.equal'hello'
				end)
				it('should properly handle disconnections', function()
					local L_1069_, L_1070_ = L_1060_.new(), false
					local L_1071_ = L_1069_:connect(function()
						L_1070_ = true
					end)
					L_1071_:disconnect()
					L_1069_:fire()
					expect(L_1070_).to.equal(false)
				end)
			end
		end)()
	end,
	[41] = function()
		local L_1072_, L_1073_, L_1074_ = L_1_(41)
		return (function(...)
			local L_1075_ = L_1074_(L_1073_.Parent.BaseMotor)
			local L_1076_ = setmetatable({}, L_1075_)
			L_1076_.__index = L_1076_
			function L_1076_.new(L_1077_arg0, L_1078_arg1)
				assert(L_1077_arg0, 'Missing argument #1: initialValue')
				assert(typeof(L_1077_arg0) == 'number', 'initialValue must be a number!')
				local L_1079_ = setmetatable(L_1075_.new(), L_1076_)
				if L_1078_arg1 ~= nil then
					L_1079_._useImplicitConnections = L_1078_arg1
				else
					L_1079_._useImplicitConnections = true
				end
				L_1079_._goal = nil
				L_1079_._state = {
					complete = true,
					value = L_1077_arg0
				}
				return L_1079_
			end
			function L_1076_.step(L_1080_arg0, L_1081_arg1)
				if L_1080_arg0._state.complete then
					return true
				end
				local L_1082_ = L_1080_arg0._goal:step(L_1080_arg0._state, L_1081_arg1)
				L_1080_arg0._state = L_1082_
				L_1080_arg0._onStep:fire(L_1082_.value)
				if L_1082_.complete then
					if L_1080_arg0._useImplicitConnections then
						L_1080_arg0:stop()
					end
					L_1080_arg0._onComplete:fire()
				end
				return L_1082_.complete
			end
			function L_1076_.getValue(L_1083_arg0)
				return L_1083_arg0._state.value
			end
			function L_1076_.setGoal(L_1084_arg0, L_1085_arg1)
				L_1084_arg0._state.complete = false
				L_1084_arg0._goal = L_1085_arg1
				L_1084_arg0._onStart:fire()
				if L_1084_arg0._useImplicitConnections then
					L_1084_arg0:start()
				end
			end
			function L_1076_.__tostring(L_1086_arg0)
				return 'Motor(Single)'
			end
			return L_1076_
		end)()
	end,
	[42] = function()
		local L_1087_, L_1088_, L_1089_ = L_1_(42)
		return (function(...)
			return function()
				local L_1090_, L_1091_ = L_1089_(L_1088_.Parent.SingleMotor), L_1089_(L_1088_.Parent.Instant)
				it('should assign new state on step', function()
					local L_1092_ = L_1090_.new(0, false)
					L_1092_:setGoal(L_1091_.new(5))
					L_1092_:step(1.6666666666666665E-2)
					expect(L_1092_._state.complete).to.equal(true)
					expect(L_1092_._state.value).to.equal(5)
				end)
				it([[should invoke onComplete listeners when the goal is completed]], function()
					local L_1093_, L_1094_ = L_1090_.new(0, false), false
					L_1093_:onComplete(function()
						L_1094_ = true
					end)
					L_1093_:setGoal(L_1091_.new(5))
					L_1093_:step(1.6666666666666665E-2)
					expect(L_1094_).to.equal(true)
				end)
				it('should start when the goal is set', function()
					local L_1095_, L_1096_ = L_1090_.new(0, false), false
					L_1095_:onStart(function()
						L_1096_ = not L_1096_
					end)
					L_1095_:setGoal(L_1091_.new(5))
					expect(L_1096_).to.equal(true)
					L_1095_:setGoal(L_1091_.new(5))
					expect(L_1096_).to.equal(false)
				end)
			end
		end)()
	end,
	[43] = function()
		L_1_(43)
		return (function(...)
			local L_1097_, L_1098_, L_1099_, L_1100_ = 0.001, 0.001, 0.0001, {}
			L_1100_.__index = L_1100_
			function L_1100_.new(L_1101_arg0, L_1102_arg1)
				assert(L_1101_arg0, 'Missing argument #1: targetValue')
				L_1102_arg1 = L_1102_arg1 or {}
				return setmetatable({
					_targetValue = L_1101_arg0,
					_frequency = L_1102_arg1.frequency or 4,
					_dampingRatio = L_1102_arg1.dampingRatio or 1
				}, L_1100_)
			end
			function L_1100_.step(L_1103_arg0, L_1104_arg1, L_1105_arg2)
				local L_1106_, L_1107_, L_1108_, L_1109_, L_1110_ = L_1103_arg0._dampingRatio, L_1103_arg0._frequency * 2 * math.pi, L_1103_arg0._targetValue, L_1104_arg1.value, L_1104_arg1.velocity or 0
				local L_1111_, L_1112_, L_1113_, L_1114_ = L_1109_ - L_1108_, (math.exp(- L_1106_ * L_1107_ * L_1105_arg2))
				if L_1106_ == 1 then
					L_1113_ = (L_1111_ * (1 + L_1107_ * L_1105_arg2) + L_1110_ * L_1105_arg2) * L_1112_ + L_1108_
					L_1114_ = (L_1110_ * (1 - L_1107_ * L_1105_arg2) - L_1111_ * (L_1107_ * L_1107_ * L_1105_arg2)) * L_1112_
				elseif L_1106_ < 1 then
					local L_1116_ = math.sqrt(1 - L_1106_ * L_1106_)
					local L_1117_, L_1118_, L_1119_ = math.cos(L_1107_ * L_1116_ * L_1105_arg2), (math.sin(L_1107_ * L_1116_ * L_1105_arg2))
					if L_1116_ > L_1099_ then
						L_1119_ = L_1118_ / L_1116_
					else
						local L_1121_ = L_1105_arg2 * L_1107_
						L_1119_ = L_1121_ + ((L_1121_ * L_1121_) * (L_1116_ * L_1116_) * (L_1116_ * L_1116_) / 20 - L_1116_ * L_1116_) * (L_1121_ * L_1121_ * L_1121_) / 6
					end
					local L_1120_
					if L_1107_ * L_1116_ > L_1099_ then
						L_1120_ = L_1118_ / (L_1107_ * L_1116_)
					else
						local L_1122_ = L_1107_ * L_1116_
						L_1120_ = L_1105_arg2 + ((L_1105_arg2 * L_1105_arg2) * (L_1122_ * L_1122_) * (L_1122_ * L_1122_) / 20 - L_1122_ * L_1122_) * (L_1105_arg2 * L_1105_arg2 * L_1105_arg2) / 6
					end
					L_1113_ = (L_1111_ * (L_1117_ + L_1106_ * L_1119_) + L_1110_ * L_1120_) * L_1112_ + L_1108_
					L_1114_ = (L_1110_ * (L_1117_ - L_1119_ * L_1106_) - L_1111_ * (L_1119_ * L_1107_)) * L_1112_
				else
					local L_1123_ = math.sqrt(L_1106_ * L_1106_ - 1)
					local L_1124_, L_1125_ = - L_1107_ * (L_1106_ - L_1123_), - L_1107_ * (L_1106_ + L_1123_)
					local L_1126_ = (L_1110_ - L_1111_ * L_1124_) / (2 * L_1107_ * L_1123_)
					local L_1127_ = L_1111_ - L_1126_
					local L_1128_, L_1129_ = L_1127_ * math.exp(L_1124_ * L_1105_arg2), L_1126_ * math.exp(L_1125_ * L_1105_arg2)
					L_1113_ = L_1128_ + L_1129_ + L_1108_
					L_1114_ = L_1128_ * L_1124_ + L_1129_ * L_1125_
				end
				local L_1115_ = math.abs(L_1114_) < L_1097_ and math.abs(L_1113_ - L_1108_) < L_1098_
				return {
					complete = L_1115_,
					value = L_1115_ and L_1108_ or L_1113_,
					velocity = L_1114_
				}
			end
			return L_1100_
		end)()
	end,
	[44] = function()
		local L_1130_, L_1131_, L_1132_ = L_1_(44)
		return (function(...)
			return function()
				local L_1133_, L_1134_ = L_1132_(L_1131_.Parent.SingleMotor), L_1132_(L_1131_.Parent.Spring)
				describe('completed state', function()
					local L_1135_, L_1136_ = L_1133_.new(0, false), L_1134_.new(1, {
						frequency = 2,
						dampingRatio = 0.75
					})
					L_1135_:setGoal(L_1136_)
					for L_1137_forvar0 = 1, 100 do
						L_1135_:step(1.6666666666666665E-2)
					end
					it('should complete', function()
						expect(L_1135_._state.complete).to.equal(true)
					end)
					it('should be exactly the goal value when completed', function()
						expect(L_1135_._state.value).to.equal(1)
					end)
				end)
				it('should inherit velocity', function()
					local L_1138_ = L_1133_.new(0, false)
					L_1138_._state = {
						complete = false,
						value = 0,
						velocity = -5
					}
					local L_1139_ = L_1134_.new(1, {
						frequency = 2,
						dampingRatio = 1
					})
					L_1138_:setGoal(L_1139_)
					L_1138_:step(1.6666666666666665E-2)
					expect(L_1138_._state.velocity < 0).to.equal(true)
				end)
			end
		end)()
	end,
	[45] = function()
		L_1_(45)
		return (function(...)
			local L_1140_ = function(L_1141_arg0)
				local L_1142_ = tostring(L_1141_arg0):match'^Motor%((.+)%)$'
				if L_1142_ then
					return true, L_1142_
				else
					return false
				end
			end
			return L_1140_
		end)()
	end,
	[46] = function()
		local L_1143_, L_1144_, L_1145_ = L_1_(46)
		return (function(...)
			return function()
				local L_1146_, L_1147_, L_1148_ = L_1145_(L_1144_.Parent.isMotor), L_1145_(L_1144_.Parent.SingleMotor), L_1145_(L_1144_.Parent.GroupMotor)
				local L_1149_, L_1150_ = L_1147_.new(0), L_1148_.new{}
				it('should properly detect motors', function()
					expect(L_1146_(L_1149_)).to.equal(true)
					expect(L_1146_(L_1150_)).to.equal(true)
				end)
				it("shouldn't detect things that aren't motors", function()
					expect(L_1146_{}).to.equal(false)
				end)
				it('should return the proper motor type', function()
					local L_1151_, L_1152_ = L_1146_(L_1149_)
					local L_1153_, L_1154_ = L_1146_(L_1150_)
					expect(L_1152_).to.equal'Single'
					expect(L_1154_).to.equal'Group'
				end)
			end
		end)()
	end,
	[47] = function()
		local L_1155_, L_1156_, L_1157_ = L_1_(47)
		return (function(...)
			local L_1158_ = {
				Names = {
					'Dark',
					'Darker',
					'Vynixu',
					'Light',
					'Aqua',
					'Amethyst',
					'ProjectZeroX'
				}
			}
			for L_1159_forvar0, L_1160_forvar1 in next, L_1156_:GetChildren() do
				local L_1161_ = L_1157_(L_1160_forvar1)
				L_1158_[L_1161_.Name] = L_1161_
			end
			return L_1158_
		end)()
	end,
	[48] = function()
		L_1_(48)
		return (function(...)
			return {
				Name = 'Amethyst',
				Accent = Color3.fromRGB(97, 62, 167),
				AcrylicMain = Color3.fromRGB(20, 20, 20),
				AcrylicBorder = Color3.fromRGB(110, 90, 130),
				AcrylicGradient = ColorSequence.new(Color3.fromRGB(85, 57, 139), Color3.fromRGB(40, 25, 65)),
				AcrylicNoise = 0.92,
				TitleBarLine = Color3.fromRGB(95, 75, 110),
				Tab = Color3.fromRGB(160, 140, 180),
				Element = Color3.fromRGB(140, 120, 160),
				ElementBorder = Color3.fromRGB(60, 50, 70),
				InElementBorder = Color3.fromRGB(100, 90, 110),
				ElementTransparency = 0.87,
				ToggleSlider = Color3.fromRGB(140, 120, 160),
				ToggleToggled = Color3.fromRGB(0, 0, 0),
				SliderRail = Color3.fromRGB(140, 120, 160),
				DropdownFrame = Color3.fromRGB(170, 160, 200),
				DropdownHolder = Color3.fromRGB(60, 45, 80),
				DropdownBorder = Color3.fromRGB(50, 40, 65),
				DropdownOption = Color3.fromRGB(140, 120, 160),
				Keybind = Color3.fromRGB(140, 120, 160),
				Input = Color3.fromRGB(140, 120, 160),
				InputFocused = Color3.fromRGB(20, 10, 30),
				InputIndicator = Color3.fromRGB(170, 150, 190),
				Dialog = Color3.fromRGB(60, 45, 80),
				DialogHolder = Color3.fromRGB(45, 30, 65),
				DialogHolderLine = Color3.fromRGB(40, 25, 60),
				DialogButton = Color3.fromRGB(60, 45, 80),
				DialogButtonBorder = Color3.fromRGB(95, 80, 110),
				DialogBorder = Color3.fromRGB(85, 70, 100),
				DialogInput = Color3.fromRGB(70, 55, 85),
				DialogInputLine = Color3.fromRGB(175, 160, 190),
				Text = Color3.fromRGB(240, 240, 240),
				SubText = Color3.fromRGB(170, 170, 170),
				Hover = Color3.fromRGB(140, 120, 160),
				HoverChange = 0.04
			}
		end)()
	end,
	[49] = function()
		L_1_(49)
		return (function(...)
			return {
				Name = 'Aqua',
				Accent = Color3.fromRGB(60, 165, 165),
				AcrylicMain = Color3.fromRGB(20, 20, 20),
				AcrylicBorder = Color3.fromRGB(50, 100, 100),
				AcrylicGradient = ColorSequence.new(Color3.fromRGB(60, 140, 140), Color3.fromRGB(40, 80, 80)),
				AcrylicNoise = 0.92,
				TitleBarLine = Color3.fromRGB(60, 120, 120),
				Tab = Color3.fromRGB(140, 180, 180),
				Element = Color3.fromRGB(110, 160, 160),
				ElementBorder = Color3.fromRGB(40, 70, 70),
				InElementBorder = Color3.fromRGB(80, 110, 110),
				ElementTransparency = 0.84,
				ToggleSlider = Color3.fromRGB(110, 160, 160),
				ToggleToggled = Color3.fromRGB(0, 0, 0),
				SliderRail = Color3.fromRGB(110, 160, 160),
				DropdownFrame = Color3.fromRGB(160, 200, 200),
				DropdownHolder = Color3.fromRGB(40, 80, 80),
				DropdownBorder = Color3.fromRGB(40, 65, 65),
				DropdownOption = Color3.fromRGB(110, 160, 160),
				Keybind = Color3.fromRGB(110, 160, 160),
				Input = Color3.fromRGB(110, 160, 160),
				InputFocused = Color3.fromRGB(20, 10, 30),
				InputIndicator = Color3.fromRGB(130, 170, 170),
				Dialog = Color3.fromRGB(40, 80, 80),
				DialogHolder = Color3.fromRGB(30, 60, 60),
				DialogHolderLine = Color3.fromRGB(25, 50, 50),
				DialogButton = Color3.fromRGB(40, 80, 80),
				DialogButtonBorder = Color3.fromRGB(80, 110, 110),
				DialogBorder = Color3.fromRGB(50, 100, 100),
				DialogInput = Color3.fromRGB(45, 90, 90),
				DialogInputLine = Color3.fromRGB(130, 170, 170),
				Text = Color3.fromRGB(240, 240, 240),
				SubText = Color3.fromRGB(170, 170, 170),
				Hover = Color3.fromRGB(110, 160, 160),
				HoverChange = 0.04
			}
		end)()
	end,
	[50] = function()
		L_1_(50)
		return (function(...)
			return {
				Name = 'Dark',
				Accent = Color3.fromRGB(96, 205, 255),
				AcrylicMain = Color3.fromRGB(60, 60, 60),
				AcrylicBorder = Color3.fromRGB(90, 90, 90),
				AcrylicGradient = ColorSequence.new(Color3.fromRGB(40, 40, 40), Color3.fromRGB(40, 40, 40)),
				AcrylicNoise = 0.9,
				TitleBarLine = Color3.fromRGB(75, 75, 75),
				Tab = Color3.fromRGB(120, 120, 120),
				Element = Color3.fromRGB(120, 120, 120),
				ElementBorder = Color3.fromRGB(35, 35, 35),
				InElementBorder = Color3.fromRGB(90, 90, 90),
				ElementTransparency = 0.87,
				ToggleSlider = Color3.fromRGB(120, 120, 120),
				ToggleToggled = Color3.fromRGB(0, 0, 0),
				SliderRail = Color3.fromRGB(120, 120, 120),
				DropdownFrame = Color3.fromRGB(160, 160, 160),
				DropdownHolder = Color3.fromRGB(45, 45, 45),
				DropdownBorder = Color3.fromRGB(35, 35, 35),
				DropdownOption = Color3.fromRGB(120, 120, 120),
				Keybind = Color3.fromRGB(120, 120, 120),
				Input = Color3.fromRGB(160, 160, 160),
				InputFocused = Color3.fromRGB(10, 10, 10),
				InputIndicator = Color3.fromRGB(150, 150, 150),
				Dialog = Color3.fromRGB(45, 45, 45),
				DialogHolder = Color3.fromRGB(35, 35, 35),
				DialogHolderLine = Color3.fromRGB(30, 30, 30),
				DialogButton = Color3.fromRGB(45, 45, 45),
				DialogButtonBorder = Color3.fromRGB(80, 80, 80),
				DialogBorder = Color3.fromRGB(70, 70, 70),
				DialogInput = Color3.fromRGB(55, 55, 55),
				DialogInputLine = Color3.fromRGB(160, 160, 160),
				Text = Color3.fromRGB(240, 240, 240),
				SubText = Color3.fromRGB(170, 170, 170),
				Hover = Color3.fromRGB(120, 120, 120),
				HoverChange = 0.07
			}
		end)()
	end,
	[51] = function()
		L_1_(51)
		return (function(...)
			return {
				Name = 'Darker',
				Accent = Color3.fromRGB(72, 138, 182),
				AcrylicMain = Color3.fromRGB(30, 30, 30),
				AcrylicBorder = Color3.fromRGB(60, 60, 60),
				AcrylicGradient = ColorSequence.new(Color3.fromRGB(25, 25, 25), Color3.fromRGB(15, 15, 15)),
				AcrylicNoise = 0.94,
				TitleBarLine = Color3.fromRGB(65, 65, 65),
				Tab = Color3.fromRGB(100, 100, 100),
				Element = Color3.fromRGB(70, 70, 70),
				ElementBorder = Color3.fromRGB(25, 25, 25),
				InElementBorder = Color3.fromRGB(55, 55, 55),
				ElementTransparency = 0.82,
				DropdownFrame = Color3.fromRGB(120, 120, 120),
				DropdownHolder = Color3.fromRGB(35, 35, 35),
				DropdownBorder = Color3.fromRGB(25, 25, 25),
				Dialog = Color3.fromRGB(35, 35, 35),
				DialogHolder = Color3.fromRGB(25, 25, 25),
				DialogHolderLine = Color3.fromRGB(20, 20, 20),
				DialogButton = Color3.fromRGB(35, 35, 35),
				DialogButtonBorder = Color3.fromRGB(55, 55, 55),
				DialogBorder = Color3.fromRGB(50, 50, 50),
				DialogInput = Color3.fromRGB(45, 45, 45),
				DialogInputLine = Color3.fromRGB(120, 120, 120)
			}
		end)()
	end,
	[52] = function()
		L_1_(52)
		return (function(...)
			return {
				Name = 'Honey',
				Accent = Color3.fromRGB(255, 204, 0),
				AcrylicMain = Color3.fromRGB(255, 229, 153),
				AcrylicBorder = Color3.fromRGB(204, 153, 0),
				AcrylicGradient = ColorSequence.new(Color3.fromRGB(215, 174, 0), Color3.fromRGB(185, 144, 0)),
				AcrylicNoise = 0.92,
				TitleBarLine = Color3.fromRGB(204, 153, 0),
				Tab = Color3.fromRGB(255, 204, 0),
				Element = Color3.fromRGB(255, 229, 153),
				ElementBorder = Color3.fromRGB(204, 153, 0),
				InElementBorder = Color3.fromRGB(255, 204, 0),
				ElementTransparency = 0.84,
				ToggleSlider = Color3.fromRGB(255, 204, 0),
				ToggleToggled = Color3.fromRGB(0, 0, 0),
				SliderRail = Color3.fromRGB(255, 204, 0),
				DropdownFrame = Color3.fromRGB(255, 229, 153),
				DropdownHolder = Color3.fromRGB(204, 153, 0),
				DropdownBorder = Color3.fromRGB(153, 102, 0),
				DropdownOption = Color3.fromRGB(255, 204, 0),
				Keybind = Color3.fromRGB(255, 204, 0),
				Input = Color3.fromRGB(255, 204, 0),
				InputFocused = Color3.fromRGB(204, 153, 0),
				InputIndicator = Color3.fromRGB(255, 229, 153),
				Dialog = Color3.fromRGB(204, 153, 0),
				DialogHolder = Color3.fromRGB(153, 102, 0),
				DialogHolderLine = Color3.fromRGB(102, 51, 0),
				DialogButton = Color3.fromRGB(204, 153, 0),
				DialogButtonBorder = Color3.fromRGB(255, 204, 0),
				DialogBorder = Color3.fromRGB(255, 204, 0),
				DialogInput = Color3.fromRGB(255, 229, 153),
				DialogInputLine = Color3.fromRGB(255, 204, 0),
				Text = Color3.fromRGB(23, 23, 23),
				SubText = Color3.fromRGB(39, 39, 39),
				Hover = Color3.fromRGB(255, 204, 0),
				HoverChange = 0.04
			}
		end)()
	end,
	[53] = function()
		L_1_(53)
		return (function(...)
			return {
				Name = 'Light',
				Accent = Color3.fromRGB(0, 103, 192),
				AcrylicMain = Color3.fromRGB(200, 200, 200),
				AcrylicBorder = Color3.fromRGB(120, 120, 120),
				AcrylicGradient = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255)),
				AcrylicNoise = 0.96,
				TitleBarLine = Color3.fromRGB(160, 160, 160),
				Tab = Color3.fromRGB(90, 90, 90),
				Element = Color3.fromRGB(255, 255, 255),
				ElementBorder = Color3.fromRGB(180, 180, 180),
				InElementBorder = Color3.fromRGB(150, 150, 150),
				ElementTransparency = 0.65,
				ToggleSlider = Color3.fromRGB(40, 40, 40),
				ToggleToggled = Color3.fromRGB(255, 255, 255),
				SliderRail = Color3.fromRGB(40, 40, 40),
				DropdownFrame = Color3.fromRGB(200, 200, 200),
				DropdownHolder = Color3.fromRGB(240, 240, 240),
				DropdownBorder = Color3.fromRGB(200, 200, 200),
				DropdownOption = Color3.fromRGB(150, 150, 150),
				Keybind = Color3.fromRGB(120, 120, 120),
				Input = Color3.fromRGB(200, 200, 200),
				InputFocused = Color3.fromRGB(100, 100, 100),
				InputIndicator = Color3.fromRGB(80, 80, 80),
				Dialog = Color3.fromRGB(255, 255, 255),
				DialogHolder = Color3.fromRGB(240, 240, 240),
				DialogHolderLine = Color3.fromRGB(228, 228, 228),
				DialogButton = Color3.fromRGB(255, 255, 255),
				DialogButtonBorder = Color3.fromRGB(190, 190, 190),
				DialogBorder = Color3.fromRGB(140, 140, 140),
				DialogInput = Color3.fromRGB(250, 250, 250),
				DialogInputLine = Color3.fromRGB(160, 160, 160),
				Text = Color3.fromRGB(0, 0, 0),
				SubText = Color3.fromRGB(40, 40, 40),
				Hover = Color3.fromRGB(50, 50, 50),
				HoverChange = 0.16
			}
		end)()
	end,
	[54] = function()
		L_1_(54)
		return (function(...)
			return {
				Name = 'ProjectZeroX',
				Accent = Color3.fromRGB(255, 0, 0),
                AcrylicMain = Color3.fromRGB(20, 20, 20),
                AcrylicBorder = Color3.fromRGB(40, 40, 40), 
                AcrylicGradient = ColorSequence.new(Color3.fromRGB(30, 30, 30), Color3.fromRGB(10, 10, 10)),
                AcrylicNoise = 0.8,           
                TitleBarLine = Color3.fromRGB(90, 90, 90),
                Tab = Color3.fromRGB(180, 0, 0),
                Element = Color3.fromRGB(180, 0, 0),
                ElementBorder = Color3.fromRGB(50, 50, 50),
                InElementBorder = Color3.fromRGB(80, 80, 80),
                ElementTransparency = 0.75,
                ToggleSlider = Color3.fromRGB(200, 0, 0),
                ToggleToggled = Color3.fromRGB(255, 255, 255),
                SliderRail = Color3.fromRGB(160, 160, 160),
                DropdownFrame = Color3.fromRGB(30, 30, 30),
                DropdownHolder = Color3.fromRGB(50, 50, 50),
                DropdownBorder = Color3.fromRGB(180, 0, 0),
                DropdownOption = Color3.fromRGB(220, 0, 0),
                Keybind = Color3.fromRGB(160, 0, 0),
                Input = Color3.fromRGB(180, 180, 180),
                InputFocused = Color3.fromRGB(0, 0, 0),
                InputIndicator = Color3.fromRGB(255, 50, 50),
                Dialog = Color3.fromRGB(30, 30, 30),
                DialogHolder = Color3.fromRGB(45, 45, 45),
                DialogHolderLine = Color3.fromRGB(180, 0, 0),
                DialogButton = Color3.fromRGB(30, 30, 30),
                DialogButtonBorder = Color3.fromRGB(255, 0, 0),
                DialogBorder = Color3.fromRGB(70, 70, 70),
                DialogInput = Color3.fromRGB(40, 40, 40),
                DialogInputLine = Color3.fromRGB(220, 0, 0),
                Text = Color3.fromRGB(255, 255, 255),
                SubText = Color3.fromRGB(170, 170, 170),
                Hover = Color3.fromRGB(220, 0, 0),
                HoverChange = 0.08,
			}
		end)()
	end,
	[55] = function()
		L_1_(55)
		return (function(...)
			return {
				Name = 'Vynixu',
				Accent = Color3.fromRGB(90, 235, 45),
				AcrylicMain = Color3.fromRGB(30, 30, 30),
				AcrylicBorder = Color3.fromRGB(60, 60, 60),
				AcrylicGradient = ColorSequence.new(Color3.fromRGB(25, 25, 25), Color3.fromRGB(15, 15, 15)),
				AcrylicNoise = 0.94,
				TitleBarLine = Color3.fromRGB(65, 65, 65),
				Tab = Color3.fromRGB(100, 100, 100),
				Element = Color3.fromRGB(70, 70, 70),
				ElementBorder = Color3.fromRGB(25, 25, 25),
				InElementBorder = Color3.fromRGB(55, 55, 55),
				ElementTransparency = 0.82,
				DropdownFrame = Color3.fromRGB(120, 120, 120),
				DropdownHolder = Color3.fromRGB(35, 35, 35),
				DropdownBorder = Color3.fromRGB(25, 25, 25),
				Dialog = Color3.fromRGB(35, 35, 35),
				DialogHolder = Color3.fromRGB(25, 25, 25),
				DialogHolderLine = Color3.fromRGB(20, 20, 20),
				DialogButton = Color3.fromRGB(35, 35, 35),
				DialogButtonBorder = Color3.fromRGB(55, 55, 55),
				DialogBorder = Color3.fromRGB(50, 50, 50),
				DialogInput = Color3.fromRGB(45, 45, 45),
				DialogInputLine = Color3.fromRGB(120, 120, 120)
			}
		end)()
	end
}, {
	{
		1,
		2,
		{
			'MainModule'
		},
		{
			{
				29,
				1,
				{
					'Packages'
				},
				{
					{
						30,
						2,
						{
							'Flipper'
						},
						{
							{
								35,
								2,
								{
									'Instant'
								}
							},
							{
								43,
								2,
								{
									'Spring'
								}
							},
							{
								34,
								2,
								{
									'GroupMotor.spec'
								}
							},
							{
								45,
								2,
								{
									'isMotor'
								}
							},
							{
								36,
								2,
								{
									'Instant.spec'
								}
							},
							{
								37,
								2,
								{
									'Linear'
								}
							},
							{
								44,
								2,
								{
									'Spring.spec'
								}
							},
							{
								42,
								2,
								{
									'SingleMotor.spec'
								}
							},
							{
								41,
								2,
								{
									'SingleMotor'
								}
							},
							{
								39,
								2,
								{
									'Signal'
								}
							},
							{
								31,
								2,
								{
									'BaseMotor'
								}
							},
							{
								40,
								2,
								{
									'Signal.spec'
								}
							},
							{
								38,
								2,
								{
									'Linear.spec'
								}
							},
							{
								32,
								2,
								{
									'BaseMotor.spec'
								}
							},
							{
								33,
								2,
								{
									'GroupMotor'
								}
							},
							{
								46,
								2,
								{
									'isMotor.spec'
								}
							}
						}
					}
				}
			},
			{
				18,
				2,
				{
					'Creator'
				}
			},
			{
				7,
				1,
				{
					'Components'
				},
				{
					{
						12,
						2,
						{
							'Notification'
						}
					},
					{
						16,
						2,
						{
							'TitleBar'
						}
					},
					{
						10,
						2,
						{
							'Dialog'
						}
					},
					{
						15,
						2,
						{
							'Textbox'
						}
					},
					{
						13,
						2,
						{
							'Section'
						}
					},
					{
						17,
						2,
						{
							'Window'
						}
					},
					{
						8,
						2,
						{
							'Assets'
						}
					},
					{
						9,
						2,
						{
							'Button'
						}
					},
					{
						11,
						2,
						{
							'Element'
						}
					},
					{
						14,
						2,
						{
							'Tab'
						}
					}
				}
			},
			{
				19,
				2,
				{
					'Elements'
				},
				{
					{
						27,
						2,
						{
							'Toggle'
						}
					},
					{
						21,
						2,
						{
							'Colorpicker'
						}
					},
					{
						20,
						2,
						{
							'Button'
						}
					},
					{
						25,
						2,
						{
							'Paragraph'
						}
					},
					{
						22,
						2,
						{
							'Dropdown'
						}
					},
					{
						26,
						2,
						{
							'Slider'
						}
					},
					{
						24,
						2,
						{
							'Keybind'
						}
					},
					{
						23,
						2,
						{
							'Input'
						}
					}
				}
			},
			{
				2,
				2,
				{
					'Acrylic'
				},
				{
					{
						4,
						2,
						{
							'AcrylicPaint'
						}
					},
					{
						6,
						2,
						{
							'Utils'
						}
					},
					{
						3,
						2,
						{
							'AcrylicBlur'
						}
					},
					{
						5,
						2,
						{
							'CreateAcrylic'
						}
					}
				}
			},
			{
				47,
				2,
				{
					'Themes'
				},
				{
					{
						49,
						2,
						{
							'Aqua'
						}
					},
					{
						51,
						2,
						{
							'Darker'
						}
					},
					{
						52,
						2,
						{
							'Honey'
						}
					},
					{
						54,
						2,
						{
							'ProjectZeroX'
						}
					},
					{
						53,
						2,
						{
							'Light'
						}
					},
					{
						55,
						2,
						{
							'Vynixu'
						}
					},
					{
						50,
						2,
						{
							'Dark'
						}
					},
					{
						48,
						2,
						{
							'Amethyst'
						}
					}
				}
			},
			{
				28,
				2,
				{
					'Icons'
				}
			}
		}
	}
}, '0.4.1', 'WaxRuntime', string, task, setmetatable, error, next, table, unpack, coroutine, script, type, require, pcall, tostring, tonumber, _VERSION
local L_22_, L_23_, L_24_, L_25_, L_26_, L_27_, L_28_ = L_11_.insert, L_11_.remove, L_11_.freeze or function(L_1162_arg0)
	return L_1162_arg0
end, L_13_.wrap, L_6_.sub, L_6_.match, L_6_.gmatch
if L_20_ and L_26_(L_20_, 1, 4) == 'Lune' then
	local L_1163_, L_1164_ = L_17_(L_16_, '@lune/task')
	if L_1163_ and L_1164_ then
		L_7_ = L_1164_
	end
end
local L_29_ = L_7_ and L_7_.defer
local L_30_, L_31_, L_32_, L_33_, L_34_, L_35_, L_36_, L_37_, L_38_ = L_29_ or function(L_1165_arg0, ...)
	L_25_(L_1165_arg0)(...)
end, {
	[1] = 'Folder',
	[2] = 'ModuleScript',
	[3] = 'Script',
	[4] = 'LocalScript',
	[5] = 'StringValue'
}, {}, {}, {}, {}, {}, {}, {}
local L_39_, L_40_ = {
	GetFullName = {
		{},
		function(L_1166_arg0)
			local L_1167_, L_1168_ = L_1166_arg0.Name, L_1166_arg0.Parent
			while L_1168_ do
				L_1167_ = L_1168_.Name .. '.' .. L_1167_
				L_1168_ = L_1168_.Parent
			end
			return L_1167_
		end
	},
	GetChildren = {
		{},
		function(L_1169_arg0)
			local L_1170_ = {}
			for L_1171_forvar0 in L_10_, L_38_[L_1169_arg0] do
				L_22_(L_1170_, L_1171_forvar0)
			end
			return L_1170_
		end
	},
	GetDescendants = {
		{},
		function(L_1172_arg0)
			local L_1173_ = {}
			for L_1174_forvar0 in L_10_, L_38_[L_1172_arg0] do
				L_22_(L_1173_, L_1174_forvar0)
				for L_1175_forvar0, L_1176_forvar1 in L_10_, L_1174_forvar0:GetDescendants() do
					L_22_(L_1173_, L_1176_forvar1)
				end
			end
			return L_1173_
		end
	},
	FindFirstChild = {
		{
			'string',
			'boolean?'
		},
		function(L_1177_arg0, L_1178_arg1, L_1179_arg2)
			local L_1180_ = L_38_[L_1177_arg0]
			for L_1181_forvar0 in L_10_, L_1180_ do
				if L_1181_forvar0.Name == L_1178_arg1 then
					return L_1181_forvar0
				end
			end
			if L_1179_arg2 then
				for L_1182_forvar0 in L_10_, L_1180_ do
					return L_1182_forvar0:FindFirstChild(L_1178_arg1, true)
				end
			end
		end
	},
	FindFirstAncestor = {
		{
			'string'
		},
		function(L_1183_arg0, L_1184_arg1)
			local L_1185_ = L_1183_arg0.Parent
			while L_1185_ do
				if L_1185_.Name == L_1184_arg1 then
					return L_1185_
				end
				L_1185_ = L_1185_.Parent
			end
		end
	},
	WaitForChild = {
		{
			'string',
			'number?'
		},
		function(L_1186_arg0, L_1187_arg1)
			return L_1186_arg0:FindFirstChild(L_1187_arg1)
		end
	}
}, {}
for L_1188_forvar0, L_1189_forvar1 in L_10_, L_39_ do
	local L_1190_, L_1191_, L_1192_ = L_1189_forvar1[1], L_1189_forvar1[2], {}
	for L_1193_forvar0, L_1194_forvar1 in L_10_, L_1190_ do
		local L_1195_, L_1196_ = L_27_(L_1194_forvar1, '^([^%?]+)(%??)')
		L_1192_[L_1193_forvar0] = {
			L_1195_,
			L_1196_
		}
	end
	L_40_[L_1188_forvar0] = function(L_1197_arg0, ...)
		if not L_38_[L_1197_arg0] then
			L_9_("Expected ':' not '.' calling member function " .. L_1188_forvar0, 2)
		end
		local L_1198_ = {
			...
		}
		for L_1199_forvar0, L_1200_forvar1 in L_10_, L_1192_ do
			local L_1201_ = L_1198_[L_1199_forvar0]
			local L_1202_, L_1203_, L_1204_ = L_15_(L_1201_), L_1200_forvar1[1], L_1200_forvar1[2]
			if L_1201_ == nil and not L_1204_ then
				L_9_('Argument ' .. L_1201_ .. ' missing or nil', 3)
			end
			if L_1203_ ~= 'any' and L_1202_ ~= L_1203_ and not (L_1202_ == 'nil' and L_1204_) then
				L_9_('Argument ' .. L_1199_forvar0 .. ' expects type "' .. L_1203_ .. '", got "' .. L_1202_ .. '"', 2)
			end
		end
		return L_1191_(L_1197_arg0, ...)
	end
end
local L_41_ = function(L_1205_arg0, L_1206_arg1, L_1207_arg2)
	local L_1208_, L_1209_, L_1210_, L_1211_, L_1212_, L_1213_ = L_8_({}, {
		__mode = 'k'
	}), function(L_1214_arg0)
		L_9_(L_1214_arg0 .. ' is not a valid (virtual) member of ' .. L_1205_arg0 .. ' "' .. L_1206_arg1 .. '"', 3)
	end, function(L_1215_arg0)
		L_9_('Unable to assign (virtual) property ' .. L_1215_arg0 .. '. Property is read only', 3)
	end, {}, {}
	L_1212_.__metatable = false
	L_1212_.__index = function(L_1216_arg0, L_1217_arg1)
		if L_1217_arg1 == 'ClassName' then
			return L_1205_arg0
		elseif L_1217_arg1 == 'Name' then
			return L_1206_arg1
		elseif L_1217_arg1 == 'Parent' then
			return L_1207_arg2
		elseif L_1205_arg0 == 'StringValue' and L_1217_arg1 == 'Value' then
			return L_1213_
		else
			local L_1218_ = L_40_[L_1217_arg1]
			if L_1218_ then
				return L_1218_
			end
		end
		for L_1219_forvar0 in L_10_, L_1208_ do
			if L_1219_forvar0.Name == L_1217_arg1 then
				return L_1219_forvar0
			end
		end
		L_1209_(L_1217_arg1)
	end
	L_1212_.__newindex = function(L_1220_arg0, L_1221_arg1, L_1222_arg2)
		if L_1221_arg1 == 'ClassName' then
			L_1210_(L_1221_arg1)
		elseif L_1221_arg1 == 'Name' then
			L_1206_arg1 = L_1222_arg2
		elseif L_1221_arg1 == 'Parent' then
			if L_1222_arg2 == L_1211_ then
				return
			end
			if L_1207_arg2 ~= nil then
				L_38_[L_1207_arg2][L_1211_] = nil
			end
			L_1207_arg2 = L_1222_arg2
			if L_1222_arg2 ~= nil then
				L_38_[L_1222_arg2][L_1211_] = true
			end
		elseif L_1205_arg0 == 'StringValue' and L_1221_arg1 == 'Value' then
			L_1213_ = L_1222_arg2
		else
			L_1209_(L_1221_arg1)
		end
	end
	L_1212_.__tostring = function()
		return L_1206_arg1
	end
	L_8_(L_1211_, L_1212_)
	L_38_[L_1211_] = L_1208_
	if L_1207_arg2 ~= nil then
		L_38_[L_1207_arg2][L_1211_] = true
	end
	return L_1211_
end
local function L_42_func(L_1223_arg0, L_1224_arg1)
	local L_1225_, L_1226_, L_1227_, L_1228_ = L_1223_arg0[1], L_1223_arg0[2], L_1223_arg0[3], L_1223_arg0[4]
	local L_1229_ = L_31_[L_1226_]
	local L_1230_ = L_1227_ and L_23_(L_1227_, 1) or L_1229_
	local L_1231_ = L_41_(L_1229_, L_1230_, L_1224_arg1)
	L_32_[L_1225_] = L_1231_
	if L_1227_ then
		for L_1232_forvar0, L_1233_forvar1 in L_10_, L_1227_ do
			L_1231_[L_1232_forvar0] = L_1233_forvar1
		end
	end
	if L_1228_ then
		for L_1234_forvar0, L_1235_forvar1 in L_10_, L_1228_ do
			L_42_func(L_1235_forvar1, L_1231_)
		end
	end
	return L_1231_
end
local L_43_ = L_41_('Folder', '[' .. L_5_ .. ']')
for L_1236_forvar0, L_1237_forvar1 in L_10_, L_3_ do
	L_42_func(L_1237_forvar1, L_43_)
end
for L_1238_forvar0, L_1239_forvar1 in L_10_, L_2_ do
	local L_1240_ = L_32_[L_1238_forvar0]
	L_33_[L_1240_] = L_1239_forvar1
	L_34_[L_1240_] = L_1238_forvar0
	local L_1241_ = L_1240_.ClassName
	if L_1241_ == 'LocalScript' or L_1241_ == 'Script' then
		L_22_(L_36_, L_1240_)
	end
end
local L_44_ = function(L_1242_arg0)
	local L_1243_, L_1244_ = L_1242_arg0.ClassName, L_35_[L_1242_arg0]
	if L_1244_ and L_1243_ == 'ModuleScript' then
		return L_12_(L_1244_)
	end
	local L_1245_, L_1246_ = L_33_[L_1242_arg0], function(L_1247_arg0)
		L_1247_arg0 = L_18_(L_1247_arg0)
		local L_1248_, L_1249_, L_1250_ = L_1242_arg0:GetFullName(), L_27_(L_1247_arg0, '[^:]+:(%d+): (.+)')
		if not L_1249_ or not L_21_ then
			return L_1248_ .. ':*: ' .. (L_1250_ or L_1247_arg0)
		end
		L_1249_ = L_19_(L_1249_)
		local L_1251_ = L_34_[L_1242_arg0]
		local L_1252_ = L_21_[L_1251_]
		local L_1253_ = L_1249_ - L_1252_ + 1
		if L_1253_ < 0 then
			L_1253_ = '?'
		end
		return L_1248_ .. ':' .. L_1253_ .. ': ' .. L_1250_
	end
	if L_1243_ == 'LocalScript' or L_1243_ == 'Script' then
		local L_1254_, L_1255_ = L_17_(L_1245_)
		if not L_1254_ then
			L_9_(L_1246_(L_1255_), 0)
		end
	else
		local L_1256_ = {
			L_17_(L_1245_)
		}
		local L_1257_ = L_23_(L_1256_, 1)
		if not L_1257_ then
			local L_1258_ = L_23_(L_1256_, 1)
			L_9_(L_1246_(L_1258_), 0)
		end
		L_35_[L_1242_arg0] = L_1256_
		return L_12_(L_1256_)
	end
end
function L_1_(L_1259_arg0)
	local L_1260_, L_1261_, L_1262_ = L_32_[L_1259_arg0], function(L_1266_arg0, ...)
		local L_1267_ = {
			L_17_(L_1266_arg0, ...)
		}
		local L_1268_ = L_23_(L_1267_, 1)
		if not L_1268_ then
			L_9_(L_1267_[1], 3)
		end
		return L_12_(L_1267_)
	end, L_24_(L_8_({}, {
		__index = L_37_,
		__newindex = function(L_1269_arg0, L_1270_arg1, L_1271_arg2)
			L_37_[L_1270_arg1] = L_1271_arg2
		end,
		__len = function()
			return # L_37_
		end,
		__iter = function()
			return L_10_, L_37_
		end
	}))
	local L_1263_, L_1264_, L_1265_ = L_24_{
		version = L_4_,
		envname = L_5_,
		shared = L_1262_,
		script = L_14_,
		require = L_16_
	}, L_1260_, function(L_1272_arg0, ...)
		local L_1273_, L_1274_, L_1275_ = L_15_(L_1272_arg0), 'Attempted to call require with a non-ModuleScript', 'Attempted to call require with self'
		if L_1273_ == 'table' and L_38_[L_1272_arg0] then
			if L_1272_arg0.ClassName ~= 'ModuleScript' then
				L_9_(L_1274_, 2)
			elseif L_1272_arg0 == L_1260_ then
				L_9_(L_1275_, 2)
			end
			return L_44_(L_1272_arg0)
		elseif L_1273_ == 'string' and L_26_(L_1272_arg0, 1, 1) ~= '@' then
			if # L_1272_arg0 == 0 then
				L_9_('Attempted to call require with empty string', 2)
			end
			local L_1276_ = L_1260_
			if L_26_(L_1272_arg0, 1, 1) == '/' then
				L_1276_ = L_43_
			elseif L_26_(L_1272_arg0, 1, 2) == './' then
				L_1272_arg0 = L_26_(L_1272_arg0, 3)
			end
			local L_1277_
			for L_1278_forvar0 in L_28_(L_1272_arg0, '([^/]*)/?') do
				local L_1279_ = L_1278_forvar0
				if L_1278_forvar0 == '..' then
					L_1279_ = 'Parent'
				end
				if L_1279_ ~= '' then
					local L_1280_ = L_1276_:FindFirstChild(L_1279_)
					if not L_1280_ then
						local L_1281_ = L_1276_.Parent
						if L_1281_ then
							L_1280_ = L_1281_:FindFirstChild(L_1279_)
						end
					end
					if L_1280_ then
						L_1276_ = L_1280_
					elseif L_1278_forvar0 ~= L_1277_ and L_1278_forvar0 ~= 'init' and L_1278_forvar0 ~= 'init.server' and L_1278_forvar0 ~= 'init.client' then
						L_9_('Virtual script path "' .. L_1272_arg0 .. '" not found', 2)
					end
				end
				L_1277_ = L_1278_forvar0
			end
			if L_1276_.ClassName ~= 'ModuleScript' then
				L_9_(L_1274_, 2)
			elseif L_1276_ == L_1260_ then
				L_9_(L_1275_, 2)
			end
			return L_44_(L_1276_)
		end
		return L_1261_(L_16_, L_1272_arg0, ...)
	end
	return L_1263_, L_1264_, L_1265_
end
for L_1282_forvar0, L_1283_forvar1 in L_10_, L_36_ do
	L_30_(L_44_, L_1283_forvar1)
end
return L_44_(L_43_:GetChildren()[1])
