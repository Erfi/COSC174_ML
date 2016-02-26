function plotskidata(plottype,t,pm,ps,am,as,gm,gs,...
    name,ylimvecp,ylimveca,ylimvecg,pl,pl2,al,gl,m,s,p,a,g,x,timelimit)

n=', normalized';
ua = ' (m/s^2)';
ug = ' (deg/sec)';

switch plottype
    
    case 1
        % Pressure data - separate plots
        
        % Master
        figure
        subplot(2,1,1), hold all
        for i=1:3
            plot(t,pm(:,i),'-')
        end
        hold off, xlabel(x), ylabel([p,n]), title([name,p,m]), legend(pl2{1:3}), grid on, xlim(timelimit)%ylim(ylimvecp)
        subplot(2,1,2), hold all
        for i=5:6
            plot(t,pm(:,i),'-')
        end
        hold off, xlabel(x), ylabel([p,n]), title([name,p,m]), legend(pl2{5:6}), grid on, xlim(timelimit)%ylim(ylimvecp)
        
        % Slave
        figure
        subplot(2,1,1), hold all
        for i=1:3
            plot(t,ps(:,i),'-')
        end
        hold off, xlabel(x), ylabel([p,n]), title([name,p,s]), legend(pl2{1:3}), grid on, xlim(timelimit)%ylim(ylimvecp)
        subplot(2,1,2), hold all
        for i=5:6
            plot(t,ps(:,i),'-')
        end
        hold off, xlabel(x), ylabel([p,n]), title([name,p,s]), legend(pl2{5:6}), grid on, xlim(timelimit)%ylim(ylimvecp)
        
    case 2
        % Accelerometer and gyro
        
        % Master
        figure
        % Accelerometer
        subplot(2,1,1), hold all
        for i=1:3
            plot(t,am(:,i))
        end
        hold off, xlabel(x), ylabel([a,ua]), title([name,a,m]), legend(al), ylim(ylimveca), grid on, xlim(timelimit)
        % Gyro
        subplot(2,1,2), hold all
        for i=1:3
            plot(t,gm(:,i))
        end
        hold off, xlabel(x), ylabel([g,ug]), title([name,g,m]), legend(gl), ylim(ylimvecg), grid on, xlim(timelimit)
        
        % Slave
        figure
        % Accelerometer
        subplot(2,1,1), hold all
        for i=1:3
            plot(t,as(:,i))
        end
        hold off, xlabel(x), ylabel([a,ua]), title([name,a,s]), legend(al), ylim(ylimveca), grid on, xlim(timelimit)
        % Gyro
        subplot(2,1,2), hold all
        for i=1:3
            plot(t,gs(:,i))
        end
        hold off, xlabel(x), ylabel([g,ug]), title([name,g,s]), legend(gl), ylim(ylimvecg), grid on, xlim(timelimit)
        
    otherwise
        % Pressure data - separate plots
        
        % Master
        figure
        subplot(2,1,1), hold all
        for i=1:3
            plot(t,pm(:,i),'-')
        end
        hold off, xlabel(x), ylabel([p,n]), title([name,p,m]), legend(pl2{1:3}),grid on, xlim(timelimit) %ylim(ylimvecp)
        subplot(2,1,2), hold all
        for i=5:6
            plot(t,pm(:,i),'-')
        end
        hold off, xlabel(x), ylabel([p,n]), title([name,p,m]), legend(pl2{5:6}), grid on, xlim(timelimit)%ylim(ylimvecp)
        
        % Slave
        figure
        subplot(2,1,1), hold all
        for i=1:3
            plot(t,ps(:,i),'-')
        end
        hold off, xlabel(x), ylabel([p,n]), title([name,p,s]), legend(pl2{1:3}), grid on, xlim(timelimit)%ylim(ylimvecp)
        subplot(2,1,2), hold all
        for i=5:6
            plot(t,ps(:,i),'-')
        end
        hold off, xlabel(x), ylabel([p,n]), title([name,p,s]), legend(pl2{5:6}), grid on, xlim(timelimit)%ylim(ylimvecp)
        
        % Accelerometer and gyro
        
        % Master
        figure
        % Accelerometer
        subplot(2,1,1), hold all
        for i=1:3
            plot(t,am(:,i))
        end
        hold off, xlabel(x), ylabel([a,ua]), title([name,a,m]), legend(al), ylim(ylimveca), grid on, xlim(timelimit)
        % Gyro
        subplot(2,1,2), hold all
        for i=1:3
            plot(t,gm(:,i))
        end
        hold off, xlabel(x), ylabel([g,ug]), title([name,g,m]), legend(gl), ylim(ylimvecg), grid on, xlim(timelimit)
        
        % Slave
        figure
        % Accelerometer
        subplot(2,1,1), hold all
        for i=1:3
            plot(t,as(:,i))
        end
        hold off, xlabel(x), ylabel([a,ua]), title([name,a,s]), legend(al), ylim(ylimveca), grid on, xlim(timelimit)
        % Gyro
        subplot(2,1,2), hold all
        for i=1:3
            plot(t,gs(:,i))
        end
        hold off, xlabel(x), ylabel([g,ug]), title([name,g,s]), legend(gl), ylim(ylimvecg), grid on, xlim(timelimit)
        
end

end