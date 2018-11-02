From: Omkar Bolla <omkar.bolla@pathpartnertech.com>
Subject: Re: Xen PV: Sample new PV driver for buffer sharing
 between domains
Date: Fri, 2 Nov 2018 10:55:15 +0530
Message-ID: <CAC4nxbtYDp5HhgC2d3KnRvzxU0LPLiehZMifmphaN_cwjv9D+Q@mail.gmail.com>
References: <CAC4nxbvWUpWQcUATQswoaVJfSq8EU7CH6-Jx1VwVGYVeOc0tZw@mail.gmail.com>
 <B9D01323-5CE0-4CAE-9A7C-2B1CE482A833@xenproject.org>
 <aebd40b7-e7d2-c861-b658-863b2c8f2079@gmail.com>
 <f688cda0-a342-0b66-fb5c-56238d941f9c@suse.com>
 <f8ae32f3-8399-24d3-fe1e-45d4c1669e1b@epam.com>
 <CAC4nxbvh6LA=t2iEdiw2UrqrQP3Zf2NtRcViJ1YNGZkyLZqYHg@mail.gmail.com>
 <d130b853-0e33-ecb7-5598-d99791a5f2bf@suse.com>
 <CAC4nxbuTQ1uP6rKiCAp7hDe-ygq9LKHQw8ggVM+fOVH-VvU8Tw@mail.gmail.com>
 <d2b9cd5a-2768-60bd-07bd-2055d1490399@suse.com>
 <CAC4nxbsBox=FgCBx5KwkkvCHwyX2MvBGoGpa1sDyS2cF0itT=Q@mail.gmail.com>
 <074697de-7265-a1fb-2970-4128a58f09ca@arm.com>
 <CAC4nxbuY0vJd8o6Vj9E14m2-sw3JZ5Spbiz3vbq2K0RQhK9p3w@mail.gmail.com>
 <c6724ce1-086f-3492-2c39-8192542ff5d8@arm.com>
 <CAC4nxbsopU7Ths1LYE1HAB8txbBv9rLGwqCgd=kQWLNDhEz6LQ@mail.gmail.com>
 <d920cfb3-a6cc-8f1b-e0b4-2b59ba768030@arm.com>
 <CAC4nxbvVfeN1gXa9sKSBNL6p21r8K6hMDpxYSSR4G1SWOb=eBg@mail.gmail.com>
 <b768f04f-a595-50db-1232-d3684265c469@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4094633085009688257=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <b768f04f-a595-50db-1232-d3684265c469@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: jgross@suse.com, xen-devel@lists.xensource.com, wei.liu2@citrix.com, Oleksandr_Andrushchenko@epam.com, Oleksandr Andrushchenko <andr2000@gmail.com>, Lars Kurth <lars.kurth.xen@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

--===============4094633085009688257==
Content-Type: multipart/alternative; boundary="0000000000004dfac50579a7c382"

--0000000000004dfac50579a7c382
Content-Type: text/plain; charset="UTF-8"

Hi,
>
> > I am trying to pass-through the display to guest domain. to do through
> > driver needs clocks. I have written simple basic clock pv frontend and
> > backend.
> > So I thought these clocks must be initialised before display driver
> > initialisation.
>
> The graphic driver should request the clock, right? So Linux will make
> sure to have the clock before initializing the display.
>

We are not using graphics(GPU), I think drm takes care of graphics. And all
clocks needed for display I enabled using clocks PV. Clocks i have checked
in host domain all got enabled properly.


> >
> > But if I start both domain and clocks script one after another, clock
> > got initialised properly. Problem solved.
> > But still i have some doubt, is it possible to do some thing in xenbits
> > src to start automatically when we start underprivileged domain?
>
> I am not entirely sure if we have a way to run a script during domain
> creation. Wei, do you know if that's possible?
>
> A workaround would be to create the domain paused, call the script and
> then unpause it.
>
> 42sh> xl create -p ...
> 42sh> ./myscript.sh
> 42sh> xl unpause <myguest>
>

Now, I am doing same way pause and unpauase domain to start PV and it is
working.

>
> >
> > I have one more question about pass-through
> > To implement pass through I took reference from below link
> > https://wiki.xen.org/images/1/17/Device_passthrough_xen.pdf
> >
> > I added 'xen-passthrough' to actual dom0 dtb and created new dtb with
> > below nodes in passthrough node
> >
> ============================================================================
> > dpe: dpe@10004000 {
> > compatible = "hisilicon,hi3660-dpe";
> > status = "ok";
> > #if 0
> > //ACTUAL REG PROPERTY of DISPLAY
> >                          reg = <0x0 0xE8600000 0x0 0x80000>,
> >                                          <0x0 0xFFF35000 0 0x1000>,
> >                                          <0x0 0xFFF0A000 0 0x1000>,
> >                                          <0x0 0xFFF31000 0 0x1000>,
> >                                          <0x0 0xE86C0000 0 0x10000>;
> > #endif
> > //reg = <0x0 0x10004000 0x0 0x80000>,
> > reg = <0x0 0x10004000 0x0 0x80000>,
> >        <0x0 0x10084000 0 0x1000>,
> >        <0x0 0x10085000 0 0x1000>,
> >        <0x0 0x10086000 0 0x1000>,
> >        <0x0 0x100C4000 0 0x10000>;
> > //      <0x0 0x10087000 0 0x10000>;
> >
> > interrupts = <0 245 4>;
> >
> > clocks = <&clk_xen HI3660_ACLK_GATE_DSS>,
> > <&clk_xen HI3660_PCLK_GATE_DSS>,
> > <&clk_xen HI3660_CLK_GATE_EDC0>,
> > <&clk_xen HI3660_CLK_GATE_LDI0>,
> > <&clk_xen HI3660_CLK_GATE_LDI1>,
> > <&clk_xen HI3660_CLK_GATE_DSS_AXI_MM>,
> > <&clk_xen HI3660_PCLK_GATE_MMBUF>;
> > clock-names = "aclk_dss",
> > "pclk_dss",
> > "clk_edc0",
> > "clk_ldi0",
> > "clk_ldi1",
> > "clk_dss_axi_mm",
> > "pclk_mmbuf";
> >
> > dma-coherent;
> >
> > port {
> > dpe_out: endpoint {
> > remote-endpoint = <&dsi_in>;
> > };
> > };
> > };
> >
> > dsi: dsi@10097000 {
> > compatible = "hisilicon,hi3660-dsi";
> > status = "ok";
> > #if 0
> > //ACTUAL REG PROPERTY of DISPLAY
> > reg = <0 0xE8601000 0 0x7F000>,
> >                                          <0 0xFFF35000 0 0x1000>;
> > #endif
> > //reg = <0 0x10097000 0 0x7F000>,
> > //<0 0x10116000 0 0x1000>;
> > reg = <0 0x10004000 0 0x80000>,
> > <0 0x10084000 0 0x1000>;
> >
> > clocks = <&clk_xen HI3660_CLK_GATE_TXDPHY0_REF>,
> > <&clk_xen HI3660_CLK_GATE_TXDPHY1_REF>,
> > <&clk_xen HI3660_CLK_GATE_TXDPHY0_CFG>,
> > <&clk_xen HI3660_CLK_GATE_TXDPHY1_CFG>,
> > <&clk_xen HI3660_PCLK_GATE_DSI0>,
> > <&clk_xen HI3660_PCLK_GATE_DSI1>;
> > clock-names = "clk_txdphy0_ref",
> > "clk_txdphy1_ref",
> > "clk_txdphy0_cfg",
> > "clk_txdphy1_cfg",
> > "pclk_dsi0",
> > "pclk_dsi1";
> >
> > #address-cells = <1>;
> > #size-cells = <0>;
> >
> > };
> > #endif
> > clocks {
> > compatible = "simple-bus";
> > #address-cells = <2>;
> > #size-cells = <2>;
> > ranges;
> > clk_xen: xen_clk@0 {
> > compatible = "xen,xen-vclk";
> > #clock-cells = <1>;
> > };
> > };
> >
> ============================================================================
> > Below is my 'debian.cfg' file:
> >
> ============================================================================
> > kernel = "/debian/Image"
> > device_tree="/debian/domu.dtb"
> > memory = 512
> > vcpus = 8
> > cpus = "all"
> > name="debian"
> >
> > ################# DPE ################
> > #iomem = [ "0xE8600,0x80@0x10004", "0xFFF35,1@0x10084",
> > "0xFFF0A,1@0x10085", "0xFFF31,1@0x10086", "0xE86C0,10@0x10087"]
> > #iomem = [ "0xE8600,0x80", "0xFFF35,1", "0xFFF0A,1", "0xFFF31,1",
> > "0xE86C0,10"]
> > irqs = [ 277 ]
> >
> > iomem = [ "0xE8600,80@0x10004" ]
> >
> > iomem = [ "0xFFF35,1@0x10084" ]
> > iomem = [ "0xFFF0A,1@0x10085" ]
> > iomem = [ "0xFFF31,1@0x10086" ]
> > iomem = [ "0xE86C0,10@0x100C4"]
> > #iomem = [ "0xE86C0,10@0x10087"]
> > #iomem = [ "0xE8600,80@0x00000" ]
> >
> > ################# DPE ################
> > ################# DSI ################
> > #iomem = [ "0xE8601,0x7F", "0xFFF35,1"]
> > #iomem = [ "0xE8601,0x7F@0x10097", "0xFFF35,1@0x10116",
> > "0xE8601,0x7F@0x10195"]
> >
> > #iomem = [ "0xE8601,7F@0x10097" ]
> > #iomem = [ "0xFFF35,1@0x10116" ]
> >
> >
> > iomem = [ "0xE8601,7F@0x10005" ]
> > iomem = [ "0xFFF35,1@0x10084" ]
> > ################# DSI ################
> >
> > #vif = ['mac=00:16:3e:64:b8:40,bridge=xenbr0']
> > #nics = 1
> > #vif = [ 'eth0=00:60:00:00:00:01' ]
> >
> > disk = ['/dev/loop1,raw,xvda,w']
> > extra = "earlyprintk=xenboot console=hvc0 root=/dev/xvda rootfstype=ext4
> > rw video=HDMI-A-1:1280x720@60"
> >
> ============================================================================
> > Here I am using same io space(GFNs) for DPE and DSI nodes, and having
> > same below error
> > and tried with different GFNs and giving same error.
> >
> > But adding this, Every thing is good but when i am trying to remap iomem
> > second time, having below error
>
> Who is going the remap? The guest? Also, can you expand what you mean by
> it crash the second time. Is it during the remap, or access the new
> mapped region?
>
Here, Guest(domain-U) is remapping in display driver.
In display driver remapping is successful and yesterday i found when i try
to access
remapped region domain-U giving that crash, "Unhandled fault: ttbr address
size fault"

>


> >
> ============================================================================
> > [    3.215021] OF: rrrrrrrrrrrr: start: 0x10004000, sz = 0x80000
> > [    3.215062] [DISPLAY] dsi_parse_dt(): 1536: of device:
> > /passthrough/dsi@10097000
> > [    3.215083] [DISPLAY] dsi_parse_dt(): 1537:
> > +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> > [    3.215108] [DISPLAY] dsi_parse_dt(): 1540: ctx->base:
> ffffff800bd01000
> > [    3.215126] [DISPLAY] dsi_parse_dt(): 1541:
> > [    3.215136] OF: rrrrrrrrrrrr: start: 0x10084000, sz = 0x1000
> > [    3.215169] [DISPLAY] dsi_parse_dt(): 1548:
> > [    4.159087] [DISPLAY] dsi_parse_dt(): 1563:
> > [    4.159092] [DISPLAY] dsi_parse_dt(): 1568:
> > [    4.159132] [D][XEN_VCLK]xen_vclk_xfer(): 163: buffer:
> clk_txdphy0_ref,1
> > [    4.159163] [D][XEN_VCLK]xen_vclk_xfer(): 164:
> > *******************************************
> > [    4.159399] [D][XEN_VCLK]xen_vclk_xfer(): 170:
> > *******************************************
> > [    4.159626] [D][XEN_VCLK]xen_vclk_xfer(): 176: Sending IRQ_DATA to
> > domain-0
> > [    4.160218] [D][XEN_VCLK]xen_vclk_interrupt(): 446: IRQ(13) from
> > domain 0 fired!!!
> > [    4.160359] [D][XEN_VCLK]vclk_fe_bh(): 394: irq_status: 0x3
> > [    4.160532] [D][XEN_VCLK]vclk_fe_bh(): 407: ACK Recieved from dom-0
> > [    4.160542] [D][XEN_VCLK]xen_vclk_xfer(): 179: Xfer Done
> > [    4.160545] [D][XEN_VCLK]xen_of_clk_src_onecell_get(): 286:  Xfer
> done...
> > [    4.160554] [DISPLAY] dsi_parse_dt(): 1575:
> > [    4.160560] [D][XEN_VCLK]vclk_round_rate(): 224:  called...
> > [    4.160567] [D][XEN_VCLK]xen_vclk_xfer(): 163: buffer:
> > clk_txdphy0_ref,4,19200000
> > [    4.160570] [D][XEN_VCLK]xen_vclk_xfer(): 164:
> > *******************************************
> > [    4.161095] [D][XEN_VCLK]xen_vclk_xfer(): 170:
> > *******************************************
> > [    4.161331] [D][XEN_VCLK]xen_vclk_xfer(): 176: Sending IRQ_DATA to
> > domain-0
> > [    4.161946] [D][XEN_VCLK]xen_vclk_interrupt(): 446: IRQ(13) from
> > domain 0 fired!!!
> > [    4.162120] [D][XEN_VCLK]vclk_fe_bh(): 394: irq_status: 0x3
> > [    4.162284] [D][XEN_VCLK]vclk_fe_bh(): 407: ACK Recieved from dom-0
> > [    4.162295] [D][XEN_VCLK]xen_vclk_xfer(): 179: Xfer Done
> > [    4.162301] [DISPLAY] dsi_parse_dt(): 1583:
> > [    4.162314] [D][XEN_VCLK]xen_vclk_xfer(): 163: buffer:
> clk_txdphy0_cfg,1
> > [    4.162316] [D][XEN_VCLK]xen_vclk_xfer(): 164:
> > *******************************************
> > [    4.162641] [D][XEN_VCLK]xen_vclk_xfer(): 170:
> > *******************************************
> > [    4.162984] [D][XEN_VCLK]xen_vclk_xfer(): 176: Sending IRQ_DATA to
> > domain-0
> > [    4.163596] [D][XEN_VCLK]xen_vclk_interrupt(): 446: IRQ(13) from
> > domain 0 fired!!!
> > [    4.167753] [D][XEN_VCLK]vclk_fe_bh(): 394: irq_status: 0x3
> > [    4.167955] [D][XEN_VCLK]vclk_fe_bh(): 407: ACK Recieved from dom-0
> > [    4.167968] [D][XEN_VCLK]xen_vclk_xfer(): 179: Xfer Done
> > [    4.167971] [D][XEN_VCLK]xen_of_clk_src_onecell_get(): 286:  Xfer
> done...
> > [    4.167979] [DISPLAY] dsi_parse_dt(): 1593:
> > [    4.167982] [D][XEN_VCLK]vclk_round_rate(): 224:  called...
> > [    4.167985] [D][XEN_VCLK]xen_vclk_xfer(): 163: buffer:
> > clk_txdphy0_cfg,4,19200000
> > [    4.167992] [D][XEN_VCLK]xen_vclk_xfer(): 164:
> > *******************************************
> > [    4.168244] [D][XEN_VCLK]xen_vclk_xfer(): 170:
> > *******************************************
> > [    4.168476] [D][XEN_VCLK]xen_vclk_xfer(): 176: Sending IRQ_DATA to
> > domain-0
> > [    4.169101] [D][XEN_VCLK]xen_vclk_interrupt(): 446: IRQ(13) from
> > domain 0 fired!!!
> > [    4.169262] [D][XEN_VCLK]vclk_fe_bh(): 394: irq_status: 0x3
> > [    4.169448] [D][XEN_VCLK]vclk_fe_bh(): 407: ACK Recieved from dom-0
> > [    4.169491] [D][XEN_VCLK]xen_vclk_xfer(): 179: Xfer Done
> > [    4.169510] [DISPLAY] dsi_parse_dt(): 1601:
> > [    4.169535] [D][XEN_VCLK]xen_vclk_xfer(): 163: buffer: pclk_dsi0,1
> > [    4.169554] [D][XEN_VCLK]xen_vclk_xfer(): 164:
> > *******************************************
> > [    4.169803] [D][XEN_VCLK]xen_vclk_xfer(): 170:
> > *******************************************
> > [    4.170019] [D][XEN_VCLK]xen_vclk_xfer(): 176: Sending IRQ_DATA to
> > domain-0
> > [    4.170619] [D][XEN_VCLK]xen_vclk_interrupt(): 446: IRQ(13) from
> > domain 0 fired!!!
> > [    4.170779] [D][XEN_VCLK]vclk_fe_bh(): 394: irq_status: 0x3
> > [    4.170965] [D][XEN_VCLK]vclk_fe_bh(): 407: ACK Recieved from dom-0
> > [    4.170978] [D][XEN_VCLK]xen_vclk_xfer(): 179: Xfer Done
> > [    4.170981] [D][XEN_VCLK]xen_of_clk_src_onecell_get(): 286:  Xfer
> done...
> > [    4.170989] [DISPLAY] dsi_parse_dt(): 1611:
> > [    4.170992] [DISPLAY] dsi_probe(): 1654: Before component add
> > [    4.170997] [DISPLAY] compare_of(): 242:
> > [    4.171002] [DISPLAY] kirin_drm_bind(): 257:
> > [    4.171004] [drm] +.
> > [    4.171386] [DISPLAY] kirin_drm_kms_init(): 105:
> > [    4.171391] [drm] +.
> > [    4.212543] [DISPLAY] kirin_drm_mode_config_init(): 91:
> > [    4.212547] [DISPLAY] dss_drm_init(): 638:
> > [    4.212563] [drm] +.
> > [    4.212585] [DISPLAY] dss_dts_parse(): 513:
> > [    4.212603] [DISPLAY] dss_dts_parse(): 530: of device:
> > /passthrough/dpe@10004000
> > [    4.212635] [DISPLAY] dss_dts_parse(): 531:
> >
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > [    4.212661] [DISPLAY] dss_dts_parse(): 532: ctx->base:
> ffffff800bd00000
> > [    4.212688] Unhandled fault: ttbr address size fault (0x96000000) at
> > 0xffffff800bd01000
>
> IIRC, this error usually happen when the region is not mapped in
> stage-2. On Xen debug-build (CONFIG_DEBUG=y in .config) you should get
> some log if there was a data abort in stage-2.
>
> I enabled (CONFIG_DEBUG=y in .config) in xenbits src,  I dont have any
log from xen.
also checked 'xl dmesg'  but no log from xen.

How to find GFNs from xen? I mean, xen maps region from RAM memory of
domain-u or
maps to memory of Domain-0 and give access to domain-u?

I am sharing log of xl dmesg after enabling guest log level:
======================================
root@hikey960:/debian# xl dmesg
(XEN) Checking for initrd in /chosen
(XEN) RAM: 0000000000000000 - 000000001abfffff
(XEN) RAM: 000000001ad88000 - 0000000031ffffff
(XEN) RAM: 0000000032101000 - 000000003dffffff
(XEN) RAM: 0000000040000000 - 000000004aee9fff
(XEN) RAM: 0000000089cc0000 - 00000000b8427fff
(XEN) RAM: 00000000b9af0000 - 00000000b9baffff
(XEN) RAM: 00000000b9c50000 - 00000000b9c54fff
(XEN) RAM: 00000000b9c56000 - 00000000b9d4ffff
(XEN) RAM: 00000000ba114000 - 00000000ba11bfff
(XEN) RAM: 00000000ba11c000 - 00000000bdbf1fff
(XEN) RAM: 00000000bdbf2000 - 00000000bdca2fff
(XEN) RAM: 00000000bdca3000 - 00000000bdd58fff
(XEN) RAM: 00000000bdd59000 - 00000000bef4ffff
(XEN) RAM: 00000000bef50000 - 00000000bef54fff
(XEN) RAM: 00000000bef55000 - 00000000bf0dffff
(XEN) RAM: 00000000bf0e0000 - 00000000bf12ffff
(XEN) RAM: 00000000bf180000 - 00000000bf188fff
(XEN) RAM: 00000000bf189000 - 00000000bfffffff
(XEN) RAM: 00000000c0000000 - 00000000dfffffff
(XEN) RAM: 0000000200000000 - 000000021fffffff
(XEN)
(XEN) MODULE[0]: 00000000b8428000 - 00000000b8436000 Device Tree
(XEN) MODULE[1]: 00000000b8544000 - 00000000b997ca00 Kernel
 console=tty0 console=hvc0 root=/dev/sdd14 rootwait rw rootfstype=ext4
efi=noruntime video=HDMI-A
-1:1280x720@60
(XEN)
(XEN) Command line: loglvl=all console=dtuart dtuart=/soc/serial@fff32000
dom0_mem=512M efi=no-rs guest_loglvl=all
(XEN) Placing Xen at 0x000000001aa00000-0x000000001ac00000
(XEN) Update BOOTMOD_XEN from 00000000b8436000-00000000b8536d81 =>
000000001aa00000-000000001ab00d81
(XEN) Domain heap initialised
(XEN) Platform: Generic System
(XEN) Looking for dtuart at "/soc/serial@fff32000", options ""
 Xen 4.8.5-pre
(XEN) Xen version 4.8.5-pre (omkar.bolla@) (aarch64-linux-gnu-gcc (Linaro
GCC 7.1-2017.05) 7.1.1 20170510) debug=n  Fri Nov  2 10:40:45 IST 2018
(XEN) Latest ChangeSet:
(XEN) Processor: 410fd034: "ARM Limited", variant: 0x0, part 0xd03, rev 0x4
(XEN) 64-bit Execution:
(XEN)   Processor Features: 0000000000002222 0000000000000000
(XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
(XEN)     Extensions: FloatingPoint AdvancedSIMD
(XEN)   Debug Features: 0000000010305106 0000000000000000
(XEN)   Auxiliary Features: 0000000000000000 0000000000000000
(XEN)   Memory Model Features: 0000000000001122 0000000000000000
(XEN)   ISA Features:  0000000000011120 0000000000000000
(XEN) 32-bit Execution:
(XEN)   Processor Features: 00000131:00011011
(XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
(XEN)     Extensions: GenericTimer Security
(XEN)   Debug Features: 03010066
(XEN)   Auxiliary Features: 00000000
(XEN)   Memory Model Features: 10201105 40000000 01260000 02102211
(XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 00011121
(XEN) Using PSCI-1.1 for SMP bringup
(XEN) SMP: Allowing 8 CPUs
(XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 1920 KHz
(XEN) GICv2 initialization:
(XEN)         gic_dist_addr=00000000e82b1000
(XEN)         gic_cpu_addr=00000000e82b2000
(XEN)         gic_hyp_addr=00000000e82b4000
(XEN)         gic_vcpu_addr=00000000e82b6000
(XEN)         gic_maintenance_irq=25
(XEN) GICv2: 384 lines, 8 cpus, secure (IID 0200143b).
(XEN) Using scheduler: SMP Credit Scheduler (credit)
(XEN) Allocated console ring of 64 KiB.
(XEN) Bringing up CPU1
(XEN) CPU 1 booted.
(XEN) Bringing up CPU2
(XEN) CPU 2 booted.
(XEN) Bringing up CPU3
(XEN) CPU 3 booted.
(XEN) Bringing up CPU4
(XEN) CPU 4 booted.
(XEN) Bringing up CPU5
(XEN) CPU 5 booted.
(XEN) Bringing up CPU6
(XEN) CPU 6 booted.
(XEN) Bringing up CPU7
(XEN) CPU 7 booted.
(XEN) Brought up 8 CPUs
(XEN) P2M: 40-bit IPA with 40-bit PA
(XEN) P2M: 3 levels with order-1 root, VTCR 0x80023558
(XEN) I/O virtualisation disabled
(XEN) build-id: baea0accc1a90dbddfdab8bcec069906a9b45ba6
(XEN) alternatives: Patching with alt table 00000000400a4868 ->
00000000400a4c04
(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading kernel from boot module @ 00000000b8544000
(XEN) Allocating 1:1 mappings totalling 512MB for dom0:
(XEN) BANK[0] 0x000000c0000000-0x000000e0000000 (512MB)
(XEN) Grant table range: 0x0000001aa00000-0x0000001aa5f000
(XEN) /framebuffer@E8600000 passthrough = 0 nirq = 5 naddr = 7
(XEN)   - MMIO: 00e8600000 - 00e8680000 P2MType=5
(XEN) Device Node: /framebuffer@E8600000
(XEN)   - MMIO: 00fff35000 - 00fff36000 P2MType=5
(XEN) Device Node: /framebuffer@E8600000
(XEN)   - MMIO: 00fff0a000 - 00fff0b000 P2MType=5
(XEN) Device Node: /framebuffer@E8600000
(XEN)   - MMIO: 00e8a09000 - 00e8a0a000 P2MType=5
(XEN) Device Node: /framebuffer@E8600000
(XEN)   - MMIO: 00e86c0000 - 00e86d0000 P2MType=5
(XEN) Device Node: /framebuffer@E8600000
(XEN)   - MMIO: 00fff02000 - 00fff03000 P2MType=5
(XEN) Device Node: /framebuffer@E8600000
(XEN)   - MMIO: 00fff31000 - 00fff32000 P2MType=5
(XEN) Device Node: /framebuffer@E8600000
(XEN) /mali@E82C0000 passthrough = 0 nirq = 3 naddr = 1
(XEN)   - MMIO: 00e82c0000 - 00e82c4000 P2MType=5
(XEN) Device Node: /mali@E82C0000
(XEN) /dpe@E8600000 passthrough = 0 nirq = 1 naddr = 5
(XEN)   - MMIO: 00e8600000 - 00e8680000 P2MType=5
(XEN) Device Node: /dpe@E8600000
(XEN)   - MMIO: 00fff35000 - 00fff36000 P2MType=5
(XEN) Device Node: /dpe@E8600000
(XEN)   - MMIO: 00fff0a000 - 00fff0b000 P2MType=5
(XEN) Device Node: /dpe@E8600000
(XEN)   - MMIO: 00fff31000 - 00fff32000 P2MType=5
(XEN) Device Node: /dpe@E8600000
(XEN)   - MMIO: 00e86c0000 - 00e86d0000 P2MType=5
(XEN) Device Node: /dpe@E8600000
(XEN) /dsi@E8601000 passthrough = 0 nirq = 0 naddr = 2
(XEN)   - MMIO: 00e8601000 - 00e8680000 P2MType=5
(XEN) Device Node: /dsi@E8601000
(XEN)   - MMIO: 00fff35000 - 00fff36000 P2MType=5
(XEN) Device Node: /dsi@E8601000
(XEN) Loading zImage from 00000000b8544000 to
00000000c0080000-00000000c14b8a00
(XEN) Allocating PPI 16 for event channel interrupt
(XEN) Loading dom0 DTB to 0x00000000c8000000-0x00000000c800a8a1
(XEN) Scrubbing Free RAM on 1 nodes using 8 CPUs
(XEN) .........done.
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch input
to Xen)
(XEN) Freed 272kB init memory.
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER4
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER8
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER12
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER16
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER20
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER24
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER28
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER32
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER36
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER40
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER44
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER0
(XEN) d0v1: vGICD: unhandled word write 0xffffffff to ICACTIVER0
(XEN) d0v2: vGICD: unhandled word write 0xffffffff to ICACTIVER0
(XEN) d0v3: vGICD: unhandled word write 0xffffffff to ICACTIVER0
(XEN) d0v4: vGICD: unhandled word write 0xffffffff to ICACTIVER0
(XEN) d0v5: vGICD: unhandled word write 0xffffffff to ICACTIVER0
(XEN) d0v6: vGICD: unhandled word write 0xffffffff to ICACTIVER0
(XEN) d0v7: vGICD: unhandled word write 0xffffffff to ICACTIVER0
-------------------------------------------------------------------------------
(XEN) memory_map:add: dom1 gfn=10084 mfn=fff35 nr=1
-------------------------------------------------------------------------------
(XEN) d1v0: vGICD: unhandled word write 0xffffffff to ICACTIVER0
(XEN) d1v1: vGICD: unhandled word write 0xffffffff to ICACTIVER0
(XEN) d1v2: vGICD: unhandled word write 0xffffffff to ICACTIVER0
(XEN) d1v3: vGICD: unhandled word write 0xffffffff to ICACTIVER0
(XEN) d1v4: vGICD: unhandled word write 0xffffffff to ICACTIVER0
(XEN) d1v5: vGICD: unhandled word write 0xffffffff to ICACTIVER0
(XEN) d1v6: vGICD: unhandled word write 0xffffffff to ICACTIVER0
(XEN) d1v7: vGICD: unhandled word write 0xffffffff to ICACTIVER0
======================================
After enabling guest log level, It is showing only one io region mapped
instead of all. Why?



> Cheers,
>
> --
> Julien Grall
>

Thanks,
Omkar B

-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly

prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.

--0000000000004dfac50579a7c382
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"color:rgb(11,83,148)"><br></div><br><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_de=
fault" style=3D"color:rgb(11,83,148)">Hi,</span><br><br>
&gt; I am trying to pass-through the display to guest domain. to do through=
 <br>
&gt; driver needs clocks. I have written simple basic clock pv frontend and=
 <br>
&gt; backend.<br>
&gt; So I thought these clocks must be initialised before display driver <b=
r>
&gt; initialisation.<br>
<br>
The graphic driver should request the clock, right? So Linux will make <br>
sure to have the clock before initializing the display.<br></blockquote><di=
v><br></div><div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)=
">We are not using graphics(GPU), I think drm takes care of graphics. And a=
ll</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">clocks =
needed for display I enabled using clocks PV. Clocks i have checked</div><d=
iv class=3D"gmail_default" style=3D"color:rgb(11,83,148)">in host domain al=
l got enabled properly.</div><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
&gt; <br>
&gt; But if I start both domain and clocks script one after another, clock =
<br>
&gt; got initialised properly. Problem solved.<br>
&gt; But still i have some doubt, is it possible to do some thing in xenbit=
s <br>
&gt; src to start automatically when we start underprivileged domain?<br>
<br>
I am not entirely sure if we have a way to run a script during domain <br>
creation. Wei, do you know if that&#39;s possible?<br>
<br>
A workaround would be to create the domain paused, call the script and <br>
then unpause it.<br>
<br>
42sh&gt; xl create -p ...<br>
42sh&gt; ./myscript.sh<br>
42sh&gt; xl unpause &lt;myguest&gt;<br></blockquote><div><br></div><div cla=
ss=3D"gmail_default" style=3D"color:rgb(11,83,148)">Now, I am doing same wa=
y pause and unpauase domain to start PV and it is working.</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; I have one more question about pass-through<br>
&gt; To implement pass through I took reference from below link<br>
&gt; <a href=3D"https://wiki.xen.org/images/1/17/Device_passthrough_xen.pdf=
" rel=3D"noreferrer" target=3D"_blank">https://wiki.xen.org/images/1/17/Dev=
ice_passthrough_xen.pdf</a><br>
&gt; <br>
&gt; I added &#39;xen-passthrough&#39; to actual dom0 dtb and created new d=
tb with <br>
&gt; below nodes in passthrough node<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>
&gt; dpe: dpe@10004000 {<br>
&gt; compatible =3D &quot;hisilicon,hi3660-dpe&quot;;<br>
&gt; status =3D &quot;ok&quot;;<br>
&gt; #if 0<br>
&gt; //ACTUAL REG PROPERTY of DISPLAY<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x0 0xE8600000 0x0 0x80000&gt;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &lt;0x0 0xFFF35000 0 0x1000&gt;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &lt;0x0 0xFFF0A000 0 0x1000&gt;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &lt;0x0 0xFFF31000 0 0x1000&gt;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &lt;0x0 0xE86C0000 0 0x10000&gt;;<br>
&gt; #endif<br>
&gt; //reg =3D &lt;0x0 0x10004000 0x0 0x80000&gt;,<br>
&gt; reg =3D &lt;0x0 0x10004000 0x0 0x80000&gt;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;0x0 0x10084000 0 0x1000&gt;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;0x0 0x10085000 0 0x1000&gt;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;0x0 0x10086000 0 0x1000&gt;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;0x0 0x100C4000 0 0x10000&gt;;<br>
&gt; //=C2=A0 =C2=A0 =C2=A0 &lt;0x0 0x10087000 0 0x10000&gt;;<br>
&gt; <br>
&gt; interrupts =3D &lt;0 245 4&gt;;<br>
&gt; <br>
&gt; clocks =3D &lt;&amp;clk_xen HI3660_ACLK_GATE_DSS&gt;,<br>
&gt; &lt;&amp;clk_xen HI3660_PCLK_GATE_DSS&gt;,<br>
&gt; &lt;&amp;clk_xen HI3660_CLK_GATE_EDC0&gt;,<br>
&gt; &lt;&amp;clk_xen HI3660_CLK_GATE_LDI0&gt;,<br>
&gt; &lt;&amp;clk_xen HI3660_CLK_GATE_LDI1&gt;,<br>
&gt; &lt;&amp;clk_xen HI3660_CLK_GATE_DSS_AXI_MM&gt;,<br>
&gt; &lt;&amp;clk_xen HI3660_PCLK_GATE_MMBUF&gt;;<br>
&gt; clock-names =3D &quot;aclk_dss&quot;,<br>
&gt; &quot;pclk_dss&quot;,<br>
&gt; &quot;clk_edc0&quot;,<br>
&gt; &quot;clk_ldi0&quot;,<br>
&gt; &quot;clk_ldi1&quot;,<br>
&gt; &quot;clk_dss_axi_mm&quot;,<br>
&gt; &quot;pclk_mmbuf&quot;;<br>
&gt; <br>
&gt; dma-coherent;<br>
&gt; <br>
&gt; port {<br>
&gt; dpe_out: endpoint {<br>
&gt; remote-endpoint =3D &lt;&amp;dsi_in&gt;;<br>
&gt; };<br>
&gt; };<br>
&gt; };<br>
&gt; <br>
&gt; dsi: dsi@10097000 {<br>
&gt; compatible =3D &quot;hisilicon,hi3660-dsi&quot;;<br>
&gt; status =3D &quot;ok&quot;;<br>
&gt; #if 0<br>
&gt; //ACTUAL REG PROPERTY of DISPLAY<br>
&gt; reg =3D &lt;0 0xE8601000 0 0x7F000&gt;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &lt;0 0xFFF35000 0 0x1000&gt;;<br>
&gt; #endif<br>
&gt; //reg =3D &lt;0 0x10097000 0 0x7F000&gt;,<br>
&gt; //&lt;0 0x10116000 0 0x1000&gt;;<br>
&gt; reg =3D &lt;0 0x10004000 0 0x80000&gt;,<br>
&gt; &lt;0 0x10084000 0 0x1000&gt;;<br>
&gt; <br>
&gt; clocks =3D &lt;&amp;clk_xen HI3660_CLK_GATE_TXDPHY0_REF&gt;,<br>
&gt; &lt;&amp;clk_xen HI3660_CLK_GATE_TXDPHY1_REF&gt;,<br>
&gt; &lt;&amp;clk_xen HI3660_CLK_GATE_TXDPHY0_CFG&gt;,<br>
&gt; &lt;&amp;clk_xen HI3660_CLK_GATE_TXDPHY1_CFG&gt;,<br>
&gt; &lt;&amp;clk_xen HI3660_PCLK_GATE_DSI0&gt;,<br>
&gt; &lt;&amp;clk_xen HI3660_PCLK_GATE_DSI1&gt;;<br>
&gt; clock-names =3D &quot;clk_txdphy0_ref&quot;,<br>
&gt; &quot;clk_txdphy1_ref&quot;,<br>
&gt; &quot;clk_txdphy0_cfg&quot;,<br>
&gt; &quot;clk_txdphy1_cfg&quot;,<br>
&gt; &quot;pclk_dsi0&quot;,<br>
&gt; &quot;pclk_dsi1&quot;;<br>
&gt; <br>
&gt; #address-cells =3D &lt;1&gt;;<br>
&gt; #size-cells =3D &lt;0&gt;;<br>
&gt; <br>
&gt; };<br>
&gt; #endif<br>
&gt; clocks {<br>
&gt; compatible =3D &quot;simple-bus&quot;;<br>
&gt; #address-cells =3D &lt;2&gt;;<br>
&gt; #size-cells =3D &lt;2&gt;;<br>
&gt; ranges;<br>
&gt; clk_xen: xen_clk@0 {<br>
&gt; compatible =3D &quot;xen,xen-vclk&quot;;<br>
&gt; #clock-cells =3D &lt;1&gt;;<br>
&gt; };<br>
&gt; };<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>
&gt; Below is my &#39;debian.cfg&#39; file:<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>
&gt; kernel =3D &quot;/debian/Image&quot;<br>
&gt; device_tree=3D&quot;/debian/domu.dtb&quot;<br>
&gt; memory =3D 512<br>
&gt; vcpus =3D 8<br>
&gt; cpus =3D &quot;all&quot;<br>
&gt; name=3D&quot;debian&quot;<br>
&gt; <br>
&gt; ################# DPE ################<br>
&gt; #iomem =3D [ &quot;0xE8600,0x80@0x10004&quot;, &quot;0xFFF35,1@0x10084=
&quot;, <br>
&gt; &quot;0xFFF0A,1@0x10085&quot;, &quot;0xFFF31,1@0x10086&quot;, &quot;0x=
E86C0,10@0x10087&quot;]<br>
&gt; #iomem =3D [ &quot;0xE8600,0x80&quot;, &quot;0xFFF35,1&quot;, &quot;0x=
FFF0A,1&quot;, &quot;0xFFF31,1&quot;, <br>
&gt; &quot;0xE86C0,10&quot;]<br>
&gt; irqs =3D [ 277 ]<br>
&gt; <br>
&gt; iomem =3D [ &quot;0xE8600,80@0x10004&quot; ]<br>
&gt; <br>
&gt; iomem =3D [ &quot;0xFFF35,1@0x10084&quot; ]<br>
&gt; iomem =3D [ &quot;0xFFF0A,1@0x10085&quot; ]<br>
&gt; iomem =3D [ &quot;0xFFF31,1@0x10086&quot; ]<br>
&gt; iomem =3D [ &quot;0xE86C0,10@0x100C4&quot;]<br>
&gt; #iomem =3D [ &quot;0xE86C0,10@0x10087&quot;]<br>
&gt; #iomem =3D [ &quot;0xE8600,80@0x00000&quot; ]<br>
&gt; <br>
&gt; ################# DPE ################<br>
&gt; ################# DSI ################<br>
&gt; #iomem =3D [ &quot;0xE8601,0x7F&quot;, &quot;0xFFF35,1&quot;]<br>
&gt; #iomem =3D [ &quot;0xE8601,0x7F@0x10097&quot;, &quot;0xFFF35,1@0x10116=
&quot;, <br>
&gt; &quot;0xE8601,0x7F@0x10195&quot;]<br>
&gt; <br>
&gt; #iomem =3D [ &quot;0xE8601,7F@0x10097&quot; ]<br>
&gt; #iomem =3D [ &quot;0xFFF35,1@0x10116&quot; ]<br>
&gt; <br>
&gt; <br>
&gt; iomem =3D [ &quot;0xE8601,7F@0x10005&quot; ]<br>
&gt; iomem =3D [ &quot;0xFFF35,1@0x10084&quot; ]<br>
&gt; ################# DSI ################<br>
&gt; <br>
&gt; #vif =3D [&#39;mac=3D00:16:3e:64:b8:40,bridge=3Dxenbr0&#39;]<br>
&gt; #nics =3D 1<br>
&gt; #vif =3D [ &#39;eth0=3D00:60:00:00:00:01&#39; ]<br>
&gt; <br>
&gt; disk =3D [&#39;/dev/loop1,raw,xvda,w&#39;]<br>
&gt; extra =3D &quot;earlyprintk=3Dxenboot console=3Dhvc0 root=3D/dev/xvda =
rootfstype=3Dext4 <br>
&gt; rw video=3DHDMI-A-1:1280x720@60&quot;<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>
&gt; Here I am using same io space(GFNs) for DPE and DSI nodes, and having =
<br>
&gt; same below error<br>
&gt; and tried with different GFNs and giving same error.<br>
&gt; <br>
&gt; But adding this, Every thing is good but when i am trying to remap iom=
em <br>
&gt; second time, having below error<br>
<br>
Who is going the remap? The guest? Also, can you expand what you mean by <b=
r>
it crash the second time. Is it during the remap, or access the new <br>
mapped region?<br>
<span class=3D"gmail_default" style=3D"color:rgb(11,83,148)"></span></block=
quote><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">Here, Gue=
st(domain-U) is remapping in display driver.</div><div class=3D"gmail_defau=
lt" style=3D"color:rgb(11,83,148)">In display driver remapping is successfu=
l and yesterday i found when i try to access=C2=A0</div><div class=3D"gmail=
_default" style=3D"color:rgb(11,83,148)">remapped region domain-U giving th=
at crash, &quot;Unhandled fault: ttbr address size fault&quot;=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0</blockquote><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_default" st=
yle=3D"color:rgb(11,83,148)"></span><br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>
&gt; [=C2=A0 =C2=A0 3.215021] OF: rrrrrrrrrrrr: start: 0x10004000, sz =3D 0=
x80000<br>
&gt; [=C2=A0 =C2=A0 3.215062] [DISPLAY] dsi_parse_dt(): 1536: of device: <b=
r>
&gt; /passthrough/dsi@10097000<br>
&gt; [=C2=A0 =C2=A0 3.215083] [DISPLAY] dsi_parse_dt(): 1537: <br>
&gt; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++<br>
&gt; [=C2=A0 =C2=A0 3.215108] [DISPLAY] dsi_parse_dt(): 1540: ctx-&gt;base:=
 ffffff800bd01000<br>
&gt; [=C2=A0 =C2=A0 3.215126] [DISPLAY] dsi_parse_dt(): 1541:<br>
&gt; [=C2=A0 =C2=A0 3.215136] OF: rrrrrrrrrrrr: start: 0x10084000, sz =3D 0=
x1000<br>
&gt; [=C2=A0 =C2=A0 3.215169] [DISPLAY] dsi_parse_dt(): 1548:<br>
&gt; [=C2=A0 =C2=A0 4.159087] [DISPLAY] dsi_parse_dt(): 1563:<br>
&gt; [=C2=A0 =C2=A0 4.159092] [DISPLAY] dsi_parse_dt(): 1568:<br>
&gt; [=C2=A0 =C2=A0 4.159132] [D][XEN_VCLK]xen_vclk_xfer(): 163: buffer: cl=
k_txdphy0_ref,1<br>
&gt; [=C2=A0 =C2=A0 4.159163] [D][XEN_VCLK]xen_vclk_xfer(): 164: <br>
&gt; *******************************************<br>
&gt; [=C2=A0 =C2=A0 4.159399] [D][XEN_VCLK]xen_vclk_xfer(): 170: <br>
&gt; *******************************************<br>
&gt; [=C2=A0 =C2=A0 4.159626] [D][XEN_VCLK]xen_vclk_xfer(): 176: Sending IR=
Q_DATA to <br>
&gt; domain-0<br>
&gt; [=C2=A0 =C2=A0 4.160218] [D][XEN_VCLK]xen_vclk_interrupt(): 446: IRQ(1=
3) from <br>
&gt; domain 0 fired!!!<br>
&gt; [=C2=A0 =C2=A0 4.160359] [D][XEN_VCLK]vclk_fe_bh(): 394: irq_status: 0=
x3<br>
&gt; [=C2=A0 =C2=A0 4.160532] [D][XEN_VCLK]vclk_fe_bh(): 407: ACK Recieved =
from dom-0<br>
&gt; [=C2=A0 =C2=A0 4.160542] [D][XEN_VCLK]xen_vclk_xfer(): 179: Xfer Done<=
br>
&gt; [=C2=A0 =C2=A0 4.160545] [D][XEN_VCLK]xen_of_clk_src_onecell_get(): 28=
6:=C2=A0 Xfer done...<br>
&gt; [=C2=A0 =C2=A0 4.160554] [DISPLAY] dsi_parse_dt(): 1575:<br>
&gt; [=C2=A0 =C2=A0 4.160560] [D][XEN_VCLK]vclk_round_rate(): 224:=C2=A0 ca=
lled...<br>
&gt; [=C2=A0 =C2=A0 4.160567] [D][XEN_VCLK]xen_vclk_xfer(): 163: buffer: <b=
r>
&gt; clk_txdphy0_ref,4,19200000<br>
&gt; [=C2=A0 =C2=A0 4.160570] [D][XEN_VCLK]xen_vclk_xfer(): 164: <br>
&gt; *******************************************<br>
&gt; [=C2=A0 =C2=A0 4.161095] [D][XEN_VCLK]xen_vclk_xfer(): 170: <br>
&gt; *******************************************<br>
&gt; [=C2=A0 =C2=A0 4.161331] [D][XEN_VCLK]xen_vclk_xfer(): 176: Sending IR=
Q_DATA to <br>
&gt; domain-0<br>
&gt; [=C2=A0 =C2=A0 4.161946] [D][XEN_VCLK]xen_vclk_interrupt(): 446: IRQ(1=
3) from <br>
&gt; domain 0 fired!!!<br>
&gt; [=C2=A0 =C2=A0 4.162120] [D][XEN_VCLK]vclk_fe_bh(): 394: irq_status: 0=
x3<br>
&gt; [=C2=A0 =C2=A0 4.162284] [D][XEN_VCLK]vclk_fe_bh(): 407: ACK Recieved =
from dom-0<br>
&gt; [=C2=A0 =C2=A0 4.162295] [D][XEN_VCLK]xen_vclk_xfer(): 179: Xfer Done<=
br>
&gt; [=C2=A0 =C2=A0 4.162301] [DISPLAY] dsi_parse_dt(): 1583:<br>
&gt; [=C2=A0 =C2=A0 4.162314] [D][XEN_VCLK]xen_vclk_xfer(): 163: buffer: cl=
k_txdphy0_cfg,1<br>
&gt; [=C2=A0 =C2=A0 4.162316] [D][XEN_VCLK]xen_vclk_xfer(): 164: <br>
&gt; *******************************************<br>
&gt; [=C2=A0 =C2=A0 4.162641] [D][XEN_VCLK]xen_vclk_xfer(): 170: <br>
&gt; *******************************************<br>
&gt; [=C2=A0 =C2=A0 4.162984] [D][XEN_VCLK]xen_vclk_xfer(): 176: Sending IR=
Q_DATA to <br>
&gt; domain-0<br>
&gt; [=C2=A0 =C2=A0 4.163596] [D][XEN_VCLK]xen_vclk_interrupt(): 446: IRQ(1=
3) from <br>
&gt; domain 0 fired!!!<br>
&gt; [=C2=A0 =C2=A0 4.167753] [D][XEN_VCLK]vclk_fe_bh(): 394: irq_status: 0=
x3<br>
&gt; [=C2=A0 =C2=A0 4.167955] [D][XEN_VCLK]vclk_fe_bh(): 407: ACK Recieved =
from dom-0<br>
&gt; [=C2=A0 =C2=A0 4.167968] [D][XEN_VCLK]xen_vclk_xfer(): 179: Xfer Done<=
br>
&gt; [=C2=A0 =C2=A0 4.167971] [D][XEN_VCLK]xen_of_clk_src_onecell_get(): 28=
6:=C2=A0 Xfer done...<br>
&gt; [=C2=A0 =C2=A0 4.167979] [DISPLAY] dsi_parse_dt(): 1593:<br>
&gt; [=C2=A0 =C2=A0 4.167982] [D][XEN_VCLK]vclk_round_rate(): 224:=C2=A0 ca=
lled...<br>
&gt; [=C2=A0 =C2=A0 4.167985] [D][XEN_VCLK]xen_vclk_xfer(): 163: buffer: <b=
r>
&gt; clk_txdphy0_cfg,4,19200000<br>
&gt; [=C2=A0 =C2=A0 4.167992] [D][XEN_VCLK]xen_vclk_xfer(): 164: <br>
&gt; *******************************************<br>
&gt; [=C2=A0 =C2=A0 4.168244] [D][XEN_VCLK]xen_vclk_xfer(): 170: <br>
&gt; *******************************************<br>
&gt; [=C2=A0 =C2=A0 4.168476] [D][XEN_VCLK]xen_vclk_xfer(): 176: Sending IR=
Q_DATA to <br>
&gt; domain-0<br>
&gt; [=C2=A0 =C2=A0 4.169101] [D][XEN_VCLK]xen_vclk_interrupt(): 446: IRQ(1=
3) from <br>
&gt; domain 0 fired!!!<br>
&gt; [=C2=A0 =C2=A0 4.169262] [D][XEN_VCLK]vclk_fe_bh(): 394: irq_status: 0=
x3<br>
&gt; [=C2=A0 =C2=A0 4.169448] [D][XEN_VCLK]vclk_fe_bh(): 407: ACK Recieved =
from dom-0<br>
&gt; [=C2=A0 =C2=A0 4.169491] [D][XEN_VCLK]xen_vclk_xfer(): 179: Xfer Done<=
br>
&gt; [=C2=A0 =C2=A0 4.169510] [DISPLAY] dsi_parse_dt(): 1601:<br>
&gt; [=C2=A0 =C2=A0 4.169535] [D][XEN_VCLK]xen_vclk_xfer(): 163: buffer: pc=
lk_dsi0,1<br>
&gt; [=C2=A0 =C2=A0 4.169554] [D][XEN_VCLK]xen_vclk_xfer(): 164: <br>
&gt; *******************************************<br>
&gt; [=C2=A0 =C2=A0 4.169803] [D][XEN_VCLK]xen_vclk_xfer(): 170: <br>
&gt; *******************************************<br>
&gt; [=C2=A0 =C2=A0 4.170019] [D][XEN_VCLK]xen_vclk_xfer(): 176: Sending IR=
Q_DATA to <br>
&gt; domain-0<br>
&gt; [=C2=A0 =C2=A0 4.170619] [D][XEN_VCLK]xen_vclk_interrupt(): 446: IRQ(1=
3) from <br>
&gt; domain 0 fired!!!<br>
&gt; [=C2=A0 =C2=A0 4.170779] [D][XEN_VCLK]vclk_fe_bh(): 394: irq_status: 0=
x3<br>
&gt; [=C2=A0 =C2=A0 4.170965] [D][XEN_VCLK]vclk_fe_bh(): 407: ACK Recieved =
from dom-0<br>
&gt; [=C2=A0 =C2=A0 4.170978] [D][XEN_VCLK]xen_vclk_xfer(): 179: Xfer Done<=
br>
&gt; [=C2=A0 =C2=A0 4.170981] [D][XEN_VCLK]xen_of_clk_src_onecell_get(): 28=
6:=C2=A0 Xfer done...<br>
&gt; [=C2=A0 =C2=A0 4.170989] [DISPLAY] dsi_parse_dt(): 1611:<br>
&gt; [=C2=A0 =C2=A0 4.170992] [DISPLAY] dsi_probe(): 1654: Before component=
 add<br>
&gt; [=C2=A0 =C2=A0 4.170997] [DISPLAY] compare_of(): 242:<br>
&gt; [=C2=A0 =C2=A0 4.171002] [DISPLAY] kirin_drm_bind(): 257:<br>
&gt; [=C2=A0 =C2=A0 4.171004] [drm] +.<br>
&gt; [=C2=A0 =C2=A0 4.171386] [DISPLAY] kirin_drm_kms_init(): 105:<br>
&gt; [=C2=A0 =C2=A0 4.171391] [drm] +.<br>
&gt; [=C2=A0 =C2=A0 4.212543] [DISPLAY] kirin_drm_mode_config_init(): 91:<b=
r>
&gt; [=C2=A0 =C2=A0 4.212547] [DISPLAY] dss_drm_init(): 638:<br>
&gt; [=C2=A0 =C2=A0 4.212563] [drm] +.<br>
&gt; [=C2=A0 =C2=A0 4.212585] [DISPLAY] dss_dts_parse(): 513:<br>
&gt; [=C2=A0 =C2=A0 4.212603] [DISPLAY] dss_dts_parse(): 530: of device: <b=
r>
&gt; /passthrough/dpe@10004000<br>
&gt; [=C2=A0 =C2=A0 4.212635] [DISPLAY] dss_dts_parse(): 531: <br>
&gt; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^<br>
&gt; [=C2=A0 =C2=A0 4.212661] [DISPLAY] dss_dts_parse(): 532: ctx-&gt;base:=
 ffffff800bd00000<br>
&gt; [=C2=A0 =C2=A0 4.212688] Unhandled fault: ttbr address size fault (0x9=
6000000) at <br>
&gt; 0xffffff800bd01000<br>
<br>
IIRC, this error usually happen when the region is not mapped in <br>
stage-2. On Xen debug-build <span class=3D"gmail_default" style=3D"color:rg=
b(11,83,148)"></span>(CONFIG_DEBUG=3Dy in .config) you should get <br>
some log if there was a data abort in stage-2.<br>
<br></blockquote><div><div class=3D"gmail_default"><span style=3D"color:rgb=
(11,83,148)">I enabled </span><font color=3D"#0b5394"><span class=3D"gmail_=
default"></span>(CONFIG_DEBUG=3Dy in .config) in xenbits src,=C2=A0 I dont =
have any log from xen.</font></div><div class=3D"gmail_default"><font color=
=3D"#0b5394">also checked &#39;xl dmesg&#39;=C2=A0 but no log from xen.=C2=
=A0</font></div><div class=3D"gmail_default"><font color=3D"#0b5394"><br></=
font></div><div class=3D"gmail_default"><font color=3D"#0b5394">How to find=
 GFNs from xen? I mean, xen maps region from RAM memory of domain-u or</fon=
t></div><div class=3D"gmail_default"><font color=3D"#0b5394">maps to memory=
 of Domain-0 and give access to domain-u?=C2=A0</font></div><div class=3D"g=
mail_default"><span style=3D"color:rgb(11,83,148)"><br></span></div><div cl=
ass=3D"gmail_default"><span style=3D"color:rgb(11,83,148)">I am sharing log=
 of xl dmesg after enabling guest log level:</span></div><div class=3D"gmai=
l_default"><span style=3D"color:rgb(11,83,148)">=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D</span></div><div class=3D"gmail_default"><span style=3D"color:=
rgb(11,83,148)"><div class=3D"gmail_default">root@hikey960:/debian# xl dmes=
g</div><div class=3D"gmail_default">(XEN) Checking for initrd in /chosen</d=
iv><div class=3D"gmail_default">(XEN) RAM: 0000000000000000 - 000000001abff=
fff</div><div class=3D"gmail_default">(XEN) RAM: 000000001ad88000 - 0000000=
031ffffff</div><div class=3D"gmail_default">(XEN) RAM: 0000000032101000 - 0=
00000003dffffff</div><div class=3D"gmail_default">(XEN) RAM: 00000000400000=
00 - 000000004aee9fff</div><div class=3D"gmail_default">(XEN) RAM: 00000000=
89cc0000 - 00000000b8427fff</div><div class=3D"gmail_default">(XEN) RAM: 00=
000000b9af0000 - 00000000b9baffff</div><div class=3D"gmail_default">(XEN) R=
AM: 00000000b9c50000 - 00000000b9c54fff</div><div class=3D"gmail_default">(=
XEN) RAM: 00000000b9c56000 - 00000000b9d4ffff</div><div class=3D"gmail_defa=
ult">(XEN) RAM: 00000000ba114000 - 00000000ba11bfff</div><div class=3D"gmai=
l_default">(XEN) RAM: 00000000ba11c000 - 00000000bdbf1fff</div><div class=
=3D"gmail_default">(XEN) RAM: 00000000bdbf2000 - 00000000bdca2fff</div><div=
 class=3D"gmail_default">(XEN) RAM: 00000000bdca3000 - 00000000bdd58fff</di=
v><div class=3D"gmail_default">(XEN) RAM: 00000000bdd59000 - 00000000bef4ff=
ff</div><div class=3D"gmail_default">(XEN) RAM: 00000000bef50000 - 00000000=
bef54fff</div><div class=3D"gmail_default">(XEN) RAM: 00000000bef55000 - 00=
000000bf0dffff</div><div class=3D"gmail_default">(XEN) RAM: 00000000bf0e000=
0 - 00000000bf12ffff</div><div class=3D"gmail_default">(XEN) RAM: 00000000b=
f180000 - 00000000bf188fff</div><div class=3D"gmail_default">(XEN) RAM: 000=
00000bf189000 - 00000000bfffffff</div><div class=3D"gmail_default">(XEN) RA=
M: 00000000c0000000 - 00000000dfffffff</div><div class=3D"gmail_default">(X=
EN) RAM: 0000000200000000 - 000000021fffffff</div><div class=3D"gmail_defau=
lt">(XEN)=C2=A0</div><div class=3D"gmail_default">(XEN) MODULE[0]: 00000000=
b8428000 - 00000000b8436000 Device Tree=C2=A0=C2=A0</div><div class=3D"gmai=
l_default">(XEN) MODULE[1]: 00000000b8544000 - 00000000b997ca00 Kernel=C2=
=A0 =C2=A0 =C2=A0 =C2=A0console=3Dtty0 console=3Dhvc0 root=3D/dev/sdd14 roo=
twait rw rootfstype=3Dext4 efi=3Dnoruntime video=3DHDMI-A</div><div class=
=3D"gmail_default">-1:1280x720@60</div><div class=3D"gmail_default">(XEN)=
=C2=A0</div><div class=3D"gmail_default">(XEN) Command line: loglvl=3Dall c=
onsole=3Ddtuart dtuart=3D/soc/serial@fff32000 dom0_mem=3D512M efi=3Dno-rs g=
uest_loglvl=3Dall</div><div class=3D"gmail_default">(XEN) Placing Xen at 0x=
000000001aa00000-0x000000001ac00000</div><div class=3D"gmail_default">(XEN)=
 Update BOOTMOD_XEN from 00000000b8436000-00000000b8536d81 =3D&gt; 00000000=
1aa00000-000000001ab00d81</div><div class=3D"gmail_default">(XEN) Domain he=
ap initialised</div><div class=3D"gmail_default">(XEN) Platform: Generic Sy=
stem</div><div class=3D"gmail_default">(XEN) Looking for dtuart at &quot;/s=
oc/serial@fff32000&quot;, options &quot;&quot;</div><div class=3D"gmail_def=
ault">=C2=A0Xen 4.8.5-pre</div><div class=3D"gmail_default">(XEN) Xen versi=
on 4.8.5-pre (omkar.bolla@) (aarch64-linux-gnu-gcc (Linaro GCC 7.1-2017.05)=
 7.1.1 20170510) debug=3Dn=C2=A0 Fri Nov=C2=A0 2 10:40:45 IST 2018</div><di=
v class=3D"gmail_default">(XEN) Latest ChangeSet:=C2=A0</div><div class=3D"=
gmail_default">(XEN) Processor: 410fd034: &quot;ARM Limited&quot;, variant:=
 0x0, part 0xd03, rev 0x4</div><div class=3D"gmail_default">(XEN) 64-bit Ex=
ecution:</div><div class=3D"gmail_default">(XEN)=C2=A0 =C2=A0Processor Feat=
ures: 0000000000002222 0000000000000000</div><div class=3D"gmail_default">(=
XEN)=C2=A0 =C2=A0 =C2=A0Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0=
:64+32</div><div class=3D"gmail_default">(XEN)=C2=A0 =C2=A0 =C2=A0Extension=
s: FloatingPoint AdvancedSIMD</div><div class=3D"gmail_default">(XEN)=C2=A0=
 =C2=A0Debug Features: 0000000010305106 0000000000000000</div><div class=3D=
"gmail_default">(XEN)=C2=A0 =C2=A0Auxiliary Features: 0000000000000000 0000=
000000000000</div><div class=3D"gmail_default">(XEN)=C2=A0 =C2=A0Memory Mod=
el Features: 0000000000001122 0000000000000000</div><div class=3D"gmail_def=
ault">(XEN)=C2=A0 =C2=A0ISA Features:=C2=A0 0000000000011120 00000000000000=
00</div><div class=3D"gmail_default">(XEN) 32-bit Execution:</div><div clas=
s=3D"gmail_default">(XEN)=C2=A0 =C2=A0Processor Features: 00000131:00011011=
</div><div class=3D"gmail_default">(XEN)=C2=A0 =C2=A0 =C2=A0Instruction Set=
s: AArch32 A32 Thumb Thumb-2 Jazelle</div><div class=3D"gmail_default">(XEN=
)=C2=A0 =C2=A0 =C2=A0Extensions: GenericTimer Security</div><div class=3D"g=
mail_default">(XEN)=C2=A0 =C2=A0Debug Features: 03010066</div><div class=3D=
"gmail_default">(XEN)=C2=A0 =C2=A0Auxiliary Features: 00000000</div><div cl=
ass=3D"gmail_default">(XEN)=C2=A0 =C2=A0Memory Model Features: 10201105 400=
00000 01260000 02102211</div><div class=3D"gmail_default">(XEN)=C2=A0 ISA F=
eatures: 02101110 13112111 21232042 01112131 00011142 00011121</div><div cl=
ass=3D"gmail_default">(XEN) Using PSCI-1.1 for SMP bringup</div><div class=
=3D"gmail_default">(XEN) SMP: Allowing 8 CPUs</div><div class=3D"gmail_defa=
ult">(XEN) Generic Timer IRQ: phys=3D30 hyp=3D26 virt=3D27 Freq: 1920 KHz</=
div><div class=3D"gmail_default">(XEN) GICv2 initialization:</div><div clas=
s=3D"gmail_default">(XEN)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic_dist_addr=3D=
00000000e82b1000</div><div class=3D"gmail_default">(XEN)=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0gic_cpu_addr=3D00000000e82b2000</div><div class=3D"gmail_d=
efault">(XEN)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic_hyp_addr=3D00000000e82b4=
000</div><div class=3D"gmail_default">(XEN)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0gic_vcpu_addr=3D00000000e82b6000</div><div class=3D"gmail_default">(XEN)=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic_maintenance_irq=3D25</div><div class=
=3D"gmail_default">(XEN) GICv2: 384 lines, 8 cpus, secure (IID 0200143b).</=
div><div class=3D"gmail_default">(XEN) Using scheduler: SMP Credit Schedule=
r (credit)</div><div class=3D"gmail_default">(XEN) Allocated console ring o=
f 64 KiB.</div><div class=3D"gmail_default">(XEN) Bringing up CPU1</div><di=
v class=3D"gmail_default">(XEN) CPU 1 booted.</div><div class=3D"gmail_defa=
ult">(XEN) Bringing up CPU2</div><div class=3D"gmail_default">(XEN) CPU 2 b=
ooted.</div><div class=3D"gmail_default">(XEN) Bringing up CPU3</div><div c=
lass=3D"gmail_default">(XEN) CPU 3 booted.</div><div class=3D"gmail_default=
">(XEN) Bringing up CPU4</div><div class=3D"gmail_default">(XEN) CPU 4 boot=
ed.</div><div class=3D"gmail_default">(XEN) Bringing up CPU5</div><div clas=
s=3D"gmail_default">(XEN) CPU 5 booted.</div><div class=3D"gmail_default">(=
XEN) Bringing up CPU6</div><div class=3D"gmail_default">(XEN) CPU 6 booted.=
</div><div class=3D"gmail_default">(XEN) Bringing up CPU7</div><div class=
=3D"gmail_default">(XEN) CPU 7 booted.</div><div class=3D"gmail_default">(X=
EN) Brought up 8 CPUs</div><div class=3D"gmail_default">(XEN) P2M: 40-bit I=
PA with 40-bit PA</div><div class=3D"gmail_default">(XEN) P2M: 3 levels wit=
h order-1 root, VTCR 0x80023558</div><div class=3D"gmail_default">(XEN) I/O=
 virtualisation disabled</div><div class=3D"gmail_default">(XEN) build-id: =
baea0accc1a90dbddfdab8bcec069906a9b45ba6</div><div class=3D"gmail_default">=
(XEN) alternatives: Patching with alt table 00000000400a4868 -&gt; 00000000=
400a4c04</div><div class=3D"gmail_default">(XEN) *** LOADING DOMAIN 0 ***</=
div><div class=3D"gmail_default">(XEN) Loading kernel from boot module @ 00=
000000b8544000</div><div class=3D"gmail_default">(XEN) Allocating 1:1 mappi=
ngs totalling 512MB for dom0:</div><div class=3D"gmail_default">(XEN) BANK[=
0] 0x000000c0000000-0x000000e0000000 (512MB)</div><div class=3D"gmail_defau=
lt">(XEN) Grant table range: 0x0000001aa00000-0x0000001aa5f000</div><div cl=
ass=3D"gmail_default">(XEN) /framebuffer@E8600000 passthrough =3D 0 nirq =
=3D 5 naddr =3D 7</div><div class=3D"gmail_default">(XEN)=C2=A0 =C2=A0- MMI=
O: 00e8600000 - 00e8680000 P2MType=3D5</div><div class=3D"gmail_default">(X=
EN) Device Node: /framebuffer@E8600000</div><div class=3D"gmail_default">(X=
EN)=C2=A0 =C2=A0- MMIO: 00fff35000 - 00fff36000 P2MType=3D5</div><div class=
=3D"gmail_default">(XEN) Device Node: /framebuffer@E8600000</div><div class=
=3D"gmail_default">(XEN)=C2=A0 =C2=A0- MMIO: 00fff0a000 - 00fff0b000 P2MTyp=
e=3D5</div><div class=3D"gmail_default">(XEN) Device Node: /framebuffer@E86=
00000</div><div class=3D"gmail_default">(XEN)=C2=A0 =C2=A0- MMIO: 00e8a0900=
0 - 00e8a0a000 P2MType=3D5</div><div class=3D"gmail_default">(XEN) Device N=
ode: /framebuffer@E8600000</div><div class=3D"gmail_default">(XEN)=C2=A0 =
=C2=A0- MMIO: 00e86c0000 - 00e86d0000 P2MType=3D5</div><div class=3D"gmail_=
default">(XEN) Device Node: /framebuffer@E8600000</div><div class=3D"gmail_=
default">(XEN)=C2=A0 =C2=A0- MMIO: 00fff02000 - 00fff03000 P2MType=3D5</div=
><div class=3D"gmail_default">(XEN) Device Node: /framebuffer@E8600000</div=
><div class=3D"gmail_default">(XEN)=C2=A0 =C2=A0- MMIO: 00fff31000 - 00fff3=
2000 P2MType=3D5</div><div class=3D"gmail_default">(XEN) Device Node: /fram=
ebuffer@E8600000</div><div class=3D"gmail_default">(XEN) /mali@E82C0000 pas=
sthrough =3D 0 nirq =3D 3 naddr =3D 1</div><div class=3D"gmail_default">(XE=
N)=C2=A0 =C2=A0- MMIO: 00e82c0000 - 00e82c4000 P2MType=3D5</div><div class=
=3D"gmail_default">(XEN) Device Node: /mali@E82C0000</div><div class=3D"gma=
il_default">(XEN) /dpe@E8600000 passthrough =3D 0 nirq =3D 1 naddr =3D 5</d=
iv><div class=3D"gmail_default">(XEN)=C2=A0 =C2=A0- MMIO: 00e8600000 - 00e8=
680000 P2MType=3D5</div><div class=3D"gmail_default">(XEN) Device Node: /dp=
e@E8600000</div><div class=3D"gmail_default">(XEN)=C2=A0 =C2=A0- MMIO: 00ff=
f35000 - 00fff36000 P2MType=3D5</div><div class=3D"gmail_default">(XEN) Dev=
ice Node: /dpe@E8600000</div><div class=3D"gmail_default">(XEN)=C2=A0 =C2=
=A0- MMIO: 00fff0a000 - 00fff0b000 P2MType=3D5</div><div class=3D"gmail_def=
ault">(XEN) Device Node: /dpe@E8600000</div><div class=3D"gmail_default">(X=
EN)=C2=A0 =C2=A0- MMIO: 00fff31000 - 00fff32000 P2MType=3D5</div><div class=
=3D"gmail_default">(XEN) Device Node: /dpe@E8600000</div><div class=3D"gmai=
l_default">(XEN)=C2=A0 =C2=A0- MMIO: 00e86c0000 - 00e86d0000 P2MType=3D5</d=
iv><div class=3D"gmail_default">(XEN) Device Node: /dpe@E8600000</div><div =
class=3D"gmail_default">(XEN) /dsi@E8601000 passthrough =3D 0 nirq =3D 0 na=
ddr =3D 2</div><div class=3D"gmail_default">(XEN)=C2=A0 =C2=A0- MMIO: 00e86=
01000 - 00e8680000 P2MType=3D5</div><div class=3D"gmail_default">(XEN) Devi=
ce Node: /dsi@E8601000</div><div class=3D"gmail_default">(XEN)=C2=A0 =C2=A0=
- MMIO: 00fff35000 - 00fff36000 P2MType=3D5</div><div class=3D"gmail_defaul=
t">(XEN) Device Node: /dsi@E8601000</div><div class=3D"gmail_default">(XEN)=
 Loading zImage from 00000000b8544000 to 00000000c0080000-00000000c14b8a00<=
/div><div class=3D"gmail_default">(XEN) Allocating PPI 16 for event channel=
 interrupt</div><div class=3D"gmail_default">(XEN) Loading dom0 DTB to 0x00=
000000c8000000-0x00000000c800a8a1</div><div class=3D"gmail_default">(XEN) S=
crubbing Free RAM on 1 nodes using 8 CPUs</div><div class=3D"gmail_default"=
>(XEN) .........done.</div><div class=3D"gmail_default">(XEN) Initial low m=
emory virq threshold set at 0x4000 pages.</div><div class=3D"gmail_default"=
>(XEN) Std. Loglevel: All</div><div class=3D"gmail_default">(XEN) Guest Log=
level: All</div><div class=3D"gmail_default">(XEN) *** Serial input -&gt; D=
OM0 (type &#39;CTRL-a&#39; three times to switch input to Xen)</div><div cl=
ass=3D"gmail_default">(XEN) Freed 272kB init memory.</div><div class=3D"gma=
il_default">(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER=
4</div><div class=3D"gmail_default">(XEN) d0v0: vGICD: unhandled word write=
 0xffffffff to ICACTIVER8</div><div class=3D"gmail_default">(XEN) d0v0: vGI=
CD: unhandled word write 0xffffffff to ICACTIVER12</div><div class=3D"gmail=
_default">(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER16=
</div><div class=3D"gmail_default">(XEN) d0v0: vGICD: unhandled word write =
0xffffffff to ICACTIVER20</div><div class=3D"gmail_default">(XEN) d0v0: vGI=
CD: unhandled word write 0xffffffff to ICACTIVER24</div><div class=3D"gmail=
_default">(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER28=
</div><div class=3D"gmail_default">(XEN) d0v0: vGICD: unhandled word write =
0xffffffff to ICACTIVER32</div><div class=3D"gmail_default">(XEN) d0v0: vGI=
CD: unhandled word write 0xffffffff to ICACTIVER36</div><div class=3D"gmail=
_default">(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER40=
</div><div class=3D"gmail_default">(XEN) d0v0: vGICD: unhandled word write =
0xffffffff to ICACTIVER44</div><div class=3D"gmail_default">(XEN) d0v0: vGI=
CD: unhandled word write 0xffffffff to ICACTIVER0</div><div class=3D"gmail_=
default">(XEN) d0v1: vGICD: unhandled word write 0xffffffff to ICACTIVER0</=
div><div class=3D"gmail_default">(XEN) d0v2: vGICD: unhandled word write 0x=
ffffffff to ICACTIVER0</div><div class=3D"gmail_default">(XEN) d0v3: vGICD:=
 unhandled word write 0xffffffff to ICACTIVER0</div><div class=3D"gmail_def=
ault">(XEN) d0v4: vGICD: unhandled word write 0xffffffff to ICACTIVER0</div=
><div class=3D"gmail_default">(XEN) d0v5: vGICD: unhandled word write 0xfff=
fffff to ICACTIVER0</div><div class=3D"gmail_default">(XEN) d0v6: vGICD: un=
handled word write 0xffffffff to ICACTIVER0</div><div class=3D"gmail_defaul=
t">(XEN) d0v7: vGICD: unhandled word write 0xffffffff to ICACTIVER0</div><d=
iv class=3D"gmail_default">------------------------------------------------=
-------------------------------</div><div class=3D"gmail_default">(XEN) mem=
ory_map:add: dom1 gfn=3D10084 mfn=3Dfff35 nr=3D1</div><div class=3D"gmail_d=
efault">-------------------------------------------------------------------=
------------<br></div><div class=3D"gmail_default">(XEN) d1v0: vGICD: unhan=
dled word write 0xffffffff to ICACTIVER0</div><div class=3D"gmail_default">=
(XEN) d1v1: vGICD: unhandled word write 0xffffffff to ICACTIVER0</div><div =
class=3D"gmail_default">(XEN) d1v2: vGICD: unhandled word write 0xffffffff =
to ICACTIVER0</div><div class=3D"gmail_default">(XEN) d1v3: vGICD: unhandle=
d word write 0xffffffff to ICACTIVER0</div><div class=3D"gmail_default">(XE=
N) d1v4: vGICD: unhandled word write 0xffffffff to ICACTIVER0</div><div cla=
ss=3D"gmail_default">(XEN) d1v5: vGICD: unhandled word write 0xffffffff to =
ICACTIVER0</div><div class=3D"gmail_default">(XEN) d1v6: vGICD: unhandled w=
ord write 0xffffffff to ICACTIVER0</div><div class=3D"gmail_default">(XEN) =
d1v7: vGICD: unhandled word write 0xffffffff to ICACTIVER0</div></span></di=
v><div class=3D"gmail_default"><span style=3D"color:rgb(11,83,148)">=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=C2=A0</span><br></div><div class=3D"gmail=
_default" style=3D"color:rgb(11,83,148)">After enabling guest log level, It=
 is showing only one io region mapped instead of all. Why?</div><br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Cheers,<br>
<br>
-- <br>
Julien Grall<br></blockquote><div><br></div><div class=3D"gmail_default" st=
yle=3D"color:rgb(11,83,148)">Thanks,</div><div class=3D"gmail_default" styl=
e=3D"color:rgb(11,83,148)">Omkar B</div></div></div></div></div>

<br>




<p><span lang=3D"EN-IN">This
message contains confidential information and is intended only for the
individual(s) named.</span><span lang=3D"EN-IN"> </span>If you are not the =
intended
recipient, you are notified that disclosing, copying, distributing or takin=
g any
action in reliance on the contents of this mail and attached file/s is stri=
ctly
prohibited<span lang=3D"EN-IN">. Please notify the
sender immediately and delete this e-mail from your system. E-mail transmis=
sion
cannot be guaranteed to be secured or error-free as information could be
intercepted, corrupted, lost, destroyed, arrive late or incomplete, or cont=
ain
viruses. The sender therefore does not accept liability for any errors or
omissions in the contents of this message, which arise as a result of e-mai=
l
transmission.</span></p>
--0000000000004dfac50579a7c382--


--===============4094633085009688257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4094633085009688257==--
