From: Omkar Bolla <omkar.bolla@pathpartnertech.com>
Subject: Re: Xen PV: Sample new PV driver for buffer sharing
 between domains
Date: Thu, 1 Nov 2018 14:45:05 +0530
Message-ID: <CAC4nxbvVfeN1gXa9sKSBNL6p21r8K6hMDpxYSSR4G1SWOb=eBg@mail.gmail.com>
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
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6198494298375653448=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <d920cfb3-a6cc-8f1b-e0b4-2b59ba768030@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: jgross@suse.com, xen-devel@lists.xensource.com, Oleksandr_Andrushchenko@epam.com, Oleksandr Andrushchenko <andr2000@gmail.com>, Lars Kurth <lars.kurth.xen@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

--===============6198494298375653448==
Content-Type: multipart/alternative; boundary="0000000000006a8932057996dbaf"

--0000000000006a8932057996dbaf
Content-Type: text/plain; charset="UTF-8"

Hi,

> May I ask why you need the dependency on the rootfs?

I am trying to pass-through the display to guest domain. to do through
driver needs clocks. I have written simple basic clock pv frontend and
backend.
So I thought these clocks must be initialised before display driver
initialisation.

But if I start both domain and clocks script one after another, clock got
initialised properly. Problem solved.
But still i have some doubt, is it possible to do some thing in xenbits src
to start automatically when we start underprivileged domain?

I have one more question about pass-through
To implement pass through I took reference from below link
https://wiki.xen.org/images/1/17/Device_passthrough_xen.pdf

I added 'xen-passthrough' to actual dom0 dtb and created new dtb with below
nodes in passthrough node
============================================================================
dpe: dpe@10004000 {
compatible = "hisilicon,hi3660-dpe";
status = "ok";
#if 0
//ACTUAL REG PROPERTY of DISPLAY
                        reg = <0x0 0xE8600000 0x0 0x80000>,
                                        <0x0 0xFFF35000 0 0x1000>,
                                        <0x0 0xFFF0A000 0 0x1000>,
                                        <0x0 0xFFF31000 0 0x1000>,
                                        <0x0 0xE86C0000 0 0x10000>;
#endif
//reg = <0x0 0x10004000 0x0 0x80000>,
reg = <0x0 0x10004000 0x0 0x80000>,
      <0x0 0x10084000 0 0x1000>,
      <0x0 0x10085000 0 0x1000>,
      <0x0 0x10086000 0 0x1000>,
      <0x0 0x100C4000 0 0x10000>;
//       <0x0 0x10087000 0 0x10000>;

interrupts = <0 245 4>;

clocks = <&clk_xen HI3660_ACLK_GATE_DSS>,
<&clk_xen HI3660_PCLK_GATE_DSS>,
<&clk_xen HI3660_CLK_GATE_EDC0>,
<&clk_xen HI3660_CLK_GATE_LDI0>,
<&clk_xen HI3660_CLK_GATE_LDI1>,
<&clk_xen HI3660_CLK_GATE_DSS_AXI_MM>,
<&clk_xen HI3660_PCLK_GATE_MMBUF>;
clock-names = "aclk_dss",
"pclk_dss",
"clk_edc0",
"clk_ldi0",
"clk_ldi1",
"clk_dss_axi_mm",
"pclk_mmbuf";

dma-coherent;

port {
dpe_out: endpoint {
remote-endpoint = <&dsi_in>;
};
};
};

dsi: dsi@10097000 {
compatible = "hisilicon,hi3660-dsi";
status = "ok";
#if 0
//ACTUAL REG PROPERTY of DISPLAY
reg = <0 0xE8601000 0 0x7F000>,
                                        <0 0xFFF35000 0 0x1000>;
#endif
// reg = <0 0x10097000 0 0x7F000>,
// <0 0x10116000 0 0x1000>;
reg = <0 0x10004000 0 0x80000>,
<0 0x10084000 0 0x1000>;

clocks = <&clk_xen HI3660_CLK_GATE_TXDPHY0_REF>,
<&clk_xen HI3660_CLK_GATE_TXDPHY1_REF>,
<&clk_xen HI3660_CLK_GATE_TXDPHY0_CFG>,
<&clk_xen HI3660_CLK_GATE_TXDPHY1_CFG>,
<&clk_xen HI3660_PCLK_GATE_DSI0>,
<&clk_xen HI3660_PCLK_GATE_DSI1>;
clock-names = "clk_txdphy0_ref",
"clk_txdphy1_ref",
"clk_txdphy0_cfg",
"clk_txdphy1_cfg",
"pclk_dsi0",
"pclk_dsi1";

#address-cells = <1>;
#size-cells = <0>;

};
#endif
clocks {
compatible = "simple-bus";
#address-cells = <2>;
#size-cells = <2>;
ranges;
clk_xen: xen_clk@0 {
compatible = "xen,xen-vclk";
#clock-cells = <1>;
};
};
============================================================================
Below is my 'debian.cfg' file:
============================================================================
kernel = "/debian/Image"
device_tree="/debian/domu.dtb"
memory = 512
vcpus = 8
cpus = "all"
name="debian"

################# DPE ################
#iomem = [ "0xE8600,0x80@0x10004", "0xFFF35,1@0x10084", "0xFFF0A,1@0x10085",
"0xFFF31,1@0x10086", "0xE86C0,10@0x10087"]
#iomem = [ "0xE8600,0x80", "0xFFF35,1", "0xFFF0A,1", "0xFFF31,1",
"0xE86C0,10"]
irqs = [ 277 ]

iomem = [ "0xE8600,80@0x10004" ]

iomem = [ "0xFFF35,1@0x10084" ]
iomem = [ "0xFFF0A,1@0x10085" ]
iomem = [ "0xFFF31,1@0x10086" ]
iomem = [ "0xE86C0,10@0x100C4"]
#iomem = [ "0xE86C0,10@0x10087"]
#iomem = [ "0xE8600,80@0x00000" ]

################# DPE ################
################# DSI ################
#iomem = [ "0xE8601,0x7F", "0xFFF35,1"]
#iomem = [ "0xE8601,0x7F@0x10097", "0xFFF35,1@0x10116",
"0xE8601,0x7F@0x10195"]

#iomem = [ "0xE8601,7F@0x10097" ]
#iomem = [ "0xFFF35,1@0x10116" ]


iomem = [ "0xE8601,7F@0x10005" ]
iomem = [ "0xFFF35,1@0x10084" ]
################# DSI ################

#vif = ['mac=00:16:3e:64:b8:40,bridge=xenbr0']
#nics = 1
#vif = [ 'eth0=00:60:00:00:00:01' ]

disk = ['/dev/loop1,raw,xvda,w']
extra = "earlyprintk=xenboot console=hvc0 root=/dev/xvda rootfstype=ext4 rw
video=HDMI-A-1:1280x720@60"
============================================================================
Here I am using same io space(GFNs) for DPE and DSI nodes, and having same
below error
and tried with different GFNs and giving same error.

But adding this, Every thing is good but when i am trying to remap iomem
second time, having below error
============================================================================
[    3.215021] OF: rrrrrrrrrrrr: start: 0x10004000, sz = 0x80000
[    3.215062] [DISPLAY] dsi_parse_dt(): 1536: of device:
/passthrough/dsi@10097000
[    3.215083] [DISPLAY] dsi_parse_dt(): 1537:
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
[    3.215108] [DISPLAY] dsi_parse_dt(): 1540: ctx->base: ffffff800bd01000
[    3.215126] [DISPLAY] dsi_parse_dt(): 1541:
[    3.215136] OF: rrrrrrrrrrrr: start: 0x10084000, sz = 0x1000
[    3.215169] [DISPLAY] dsi_parse_dt(): 1548:
[    4.159087] [DISPLAY] dsi_parse_dt(): 1563:
[    4.159092] [DISPLAY] dsi_parse_dt(): 1568:
[    4.159132] [D][XEN_VCLK]xen_vclk_xfer(): 163: buffer: clk_txdphy0_ref,1
[    4.159163] [D][XEN_VCLK]xen_vclk_xfer(): 164:
*******************************************
[    4.159399] [D][XEN_VCLK]xen_vclk_xfer(): 170:
*******************************************
[    4.159626] [D][XEN_VCLK]xen_vclk_xfer(): 176: Sending IRQ_DATA to
domain-0
[    4.160218] [D][XEN_VCLK]xen_vclk_interrupt(): 446: IRQ(13) from domain
0 fired!!!
[    4.160359] [D][XEN_VCLK]vclk_fe_bh(): 394: irq_status: 0x3
[    4.160532] [D][XEN_VCLK]vclk_fe_bh(): 407: ACK Recieved from dom-0
[    4.160542] [D][XEN_VCLK]xen_vclk_xfer(): 179: Xfer Done
[    4.160545] [D][XEN_VCLK]xen_of_clk_src_onecell_get(): 286:  Xfer done...
[    4.160554] [DISPLAY] dsi_parse_dt(): 1575:
[    4.160560] [D][XEN_VCLK]vclk_round_rate(): 224:  called...
[    4.160567] [D][XEN_VCLK]xen_vclk_xfer(): 163: buffer:
clk_txdphy0_ref,4,19200000
[    4.160570] [D][XEN_VCLK]xen_vclk_xfer(): 164:
*******************************************
[    4.161095] [D][XEN_VCLK]xen_vclk_xfer(): 170:
*******************************************
[    4.161331] [D][XEN_VCLK]xen_vclk_xfer(): 176: Sending IRQ_DATA to
domain-0
[    4.161946] [D][XEN_VCLK]xen_vclk_interrupt(): 446: IRQ(13) from domain
0 fired!!!
[    4.162120] [D][XEN_VCLK]vclk_fe_bh(): 394: irq_status: 0x3
[    4.162284] [D][XEN_VCLK]vclk_fe_bh(): 407: ACK Recieved from dom-0
[    4.162295] [D][XEN_VCLK]xen_vclk_xfer(): 179: Xfer Done
[    4.162301] [DISPLAY] dsi_parse_dt(): 1583:
[    4.162314] [D][XEN_VCLK]xen_vclk_xfer(): 163: buffer: clk_txdphy0_cfg,1
[    4.162316] [D][XEN_VCLK]xen_vclk_xfer(): 164:
*******************************************
[    4.162641] [D][XEN_VCLK]xen_vclk_xfer(): 170:
*******************************************
[    4.162984] [D][XEN_VCLK]xen_vclk_xfer(): 176: Sending IRQ_DATA to
domain-0
[    4.163596] [D][XEN_VCLK]xen_vclk_interrupt(): 446: IRQ(13) from domain
0 fired!!!
[    4.167753] [D][XEN_VCLK]vclk_fe_bh(): 394: irq_status: 0x3
[    4.167955] [D][XEN_VCLK]vclk_fe_bh(): 407: ACK Recieved from dom-0
[    4.167968] [D][XEN_VCLK]xen_vclk_xfer(): 179: Xfer Done
[    4.167971] [D][XEN_VCLK]xen_of_clk_src_onecell_get(): 286:  Xfer done...
[    4.167979] [DISPLAY] dsi_parse_dt(): 1593:
[    4.167982] [D][XEN_VCLK]vclk_round_rate(): 224:  called...
[    4.167985] [D][XEN_VCLK]xen_vclk_xfer(): 163: buffer:
clk_txdphy0_cfg,4,19200000
[    4.167992] [D][XEN_VCLK]xen_vclk_xfer(): 164:
*******************************************
[    4.168244] [D][XEN_VCLK]xen_vclk_xfer(): 170:
*******************************************
[    4.168476] [D][XEN_VCLK]xen_vclk_xfer(): 176: Sending IRQ_DATA to
domain-0
[    4.169101] [D][XEN_VCLK]xen_vclk_interrupt(): 446: IRQ(13) from domain
0 fired!!!
[    4.169262] [D][XEN_VCLK]vclk_fe_bh(): 394: irq_status: 0x3
[    4.169448] [D][XEN_VCLK]vclk_fe_bh(): 407: ACK Recieved from dom-0
[    4.169491] [D][XEN_VCLK]xen_vclk_xfer(): 179: Xfer Done
[    4.169510] [DISPLAY] dsi_parse_dt(): 1601:
[    4.169535] [D][XEN_VCLK]xen_vclk_xfer(): 163: buffer: pclk_dsi0,1
[    4.169554] [D][XEN_VCLK]xen_vclk_xfer(): 164:
*******************************************
[    4.169803] [D][XEN_VCLK]xen_vclk_xfer(): 170:
*******************************************
[    4.170019] [D][XEN_VCLK]xen_vclk_xfer(): 176: Sending IRQ_DATA to
domain-0
[    4.170619] [D][XEN_VCLK]xen_vclk_interrupt(): 446: IRQ(13) from domain
0 fired!!!
[    4.170779] [D][XEN_VCLK]vclk_fe_bh(): 394: irq_status: 0x3
[    4.170965] [D][XEN_VCLK]vclk_fe_bh(): 407: ACK Recieved from dom-0
[    4.170978] [D][XEN_VCLK]xen_vclk_xfer(): 179: Xfer Done
[    4.170981] [D][XEN_VCLK]xen_of_clk_src_onecell_get(): 286:  Xfer done...
[    4.170989] [DISPLAY] dsi_parse_dt(): 1611:
[    4.170992] [DISPLAY] dsi_probe(): 1654: Before component add
[    4.170997] [DISPLAY] compare_of(): 242:
[    4.171002] [DISPLAY] kirin_drm_bind(): 257:
[    4.171004] [drm] +.
[    4.171386] [DISPLAY] kirin_drm_kms_init(): 105:
[    4.171391] [drm] +.
[    4.212543] [DISPLAY] kirin_drm_mode_config_init(): 91:
[    4.212547] [DISPLAY] dss_drm_init(): 638:
[    4.212563] [drm] +.
[    4.212585] [DISPLAY] dss_dts_parse(): 513:
[    4.212603] [DISPLAY] dss_dts_parse(): 530: of device:
/passthrough/dpe@10004000
[    4.212635] [DISPLAY] dss_dts_parse(): 531:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[    4.212661] [DISPLAY] dss_dts_parse(): 532: ctx->base: ffffff800bd00000
[    4.212688] Unhandled fault: ttbr address size fault (0x96000000) at
0xffffff800bd01000
[    4.212708] Mem abort info:
[    4.212720]   Exception class = DABT (current EL), IL = 32 bits
[    4.212738]   SET = 0, FnV = 0
[    4.212751]   EA = 0, S1PTW = 0
[    4.212763] Data abort info:
[    4.212776]   ISV = 0, ISS = 0x00000000
[    4.212789]   CM = 0, WnR = 0
[    4.212806] Internal error: : 96000000 [#1] PREEMPT SMP
[    4.212821] Modules linked in:
[    4.212839] CPU: 7 PID: 99 Comm: kworker/7:1 Tainted: G S
4.14.0-rc7 #456
[    4.212857] Hardware name: XENVM-4.8 (DT)
[    4.212878] Workqueue: events deferred_probe_work_func
[    4.212893] task: ffffffc01abe6000 task.stack: ffffff8009878000
[    4.212916] PC is at dss_drm_init+0x1a8/0x680
[    4.212931] LR is at dss_drm_init+0x1a0/0x680
[    4.212945] pc : [<ffffff80087061d0>] lr : [<ffffff80087061c8>] pstate:
40000045
[    4.212963] sp : ffffff800987ba20
[    4.212973] x29: ffffff800987ba30 x28: ffffffc01bff42e8
[    4.212990] x27: ffffff800bd01000 x26: ffffffc018d25760
[    4.213006] x25: ffffff80090f8c70 x24: ffffffc017212800
[    4.213023] x23: ffffff8008e32000 x22: ffffff80090f8000
[    4.213039] x21: ffffff8008e32748 x20: ffffffc018d25018
[    4.213055] x19: ffffffc01abdf810 x18: 0000000000000010
[    4.213071] x17: 000000000000000e x16: 0000000000000020
[    4.213087] x15: ffffffffffffffff x14: ffffff80894c6157
[    4.213104] x13: ffffff80094c6165 x12: ffffff8009379000
[    4.213120] x11: 0000000005f5e0ff x10: ffffff800987b6f0
[    4.257555] x9 : 00000000ffffffd0 x8 : 000000000000004b
[    4.257573] x7 : 000000000000000c x6 : 00000000000001ee
[    4.257591] x5 : 0000000000007ceb x4 : 0000000000000000
[    4.257608] x3 : ffffff800934a000 x2 : 0000000000000000
[    4.257625] x1 : 0000000000000000 x0 : 000000000000003b
[    4.257644] Process kworker/7:1 (pid: 99, stack limit =
0xffffff8009878000)
[    4.257661] Call trace:
[    4.257672] Exception stack(0xffffff800987b8e0 to 0xffffff800987ba20)
[    4.257691] b8e0: 000000000000003b 0000000000000000 0000000000000000
ffffff800934a000
[    4.257713] b900: 0000000000000000 0000000000007ceb 00000000000001ee
000000000000000c
[    4.257734] b920: 000000000000004b 00000000ffffffd0 ffffff800987b6f0
0000000005f5e0ff
[    4.257756] b940: ffffff8009379000 ffffff80094c6165 ffffff80894c6157
ffffffffffffffff
[    4.257777] b960: 0000000000000020 000000000000000e 0000000000000010
ffffffc01abdf810
[    4.257799] b980: ffffffc018d25018 ffffff8008e32748 ffffff80090f8000
ffffff8008e32000
[    4.257821] b9a0: ffffffc017212800 ffffff80090f8c70 ffffffc018d25760
ffffff800bd01000
[    4.257842] b9c0: ffffffc01bff42e8 ffffff800987ba30 ffffff80087061c8
ffffff800987ba20
[    4.257864] b9e0: ffffff80087061d0 0000000040000045 0000000000000214
ffffff800bd00000
[    4.257885] ba00: ffffffffffffffff 0000000000007c9f ffffff800987ba30
ffffff80087061d0
[    4.257908] [<ffffff80087061d0>] dss_drm_init+0x1a8/0x680
[    4.257926] [<ffffff8008705490>] kirin_drm_bind+0x128/0x310
[    4.257945] [<ffffff8008740c88>] try_to_bring_up_master+0x180/0x1e0
[    4.257965] [<ffffff8008740d8c>] component_add+0xa4/0x170
[    4.257981] [<ffffff800870b574>] dsi_probe+0x52c/0x5a0
[    4.258000] [<ffffff8008749d60>] platform_drv_probe+0x60/0xc0
[    4.258018] [<ffffff8008747a94>] driver_probe_device+0x234/0x2e0
[    4.258037] [<ffffff8008747cb0>] __device_attach_driver+0xa0/0xe8
[    4.258056] [<ffffff80087459d0>] bus_for_each_drv+0x58/0xa8
[    4.258072] [<ffffff80087476e8>] __device_attach+0xc8/0x138
[    4.302470] [<ffffff8008747d74>] device_initial_probe+0x24/0x30
[    4.302490] [<ffffff8008746ae4>] bus_probe_device+0x9c/0xa8
[    4.302506] [<ffffff8008746fcc>] deferred_probe_work_func+0xac/0x150
[    4.302528] [<ffffff80080efd98>] process_one_work+0x1d8/0x490
[    4.302547] [<ffffff80080f0298>] worker_thread+0x248/0x478
[    4.302565] [<ffffff80080f6728>] kthread+0x138/0x140
[    4.302584] [<ffffff8008084d7c>] ret_from_fork+0x10/0x1c
[    4.302601] Code: f90037a4 97e8a1ea f943a69b 9140077b (b940037b)
[    4.302621] ---[ end trace d64c23a811313502 ]---
[    4.302638] Kernel panic - not syncing: Fatal exception
[    4.302656] SMP: stopping secondary CPUs
[    4.332694] Kernel Offset: disabled
[    4.332708] CPU features: 0x002004
[    4.332720] Memory Limit: none
[    4.332736] Rebooting in 5 seconds..
============================================================================

How to fix this IO addr size fault, I think some problem in dts or
debian.cfg to map Physical addresses to GFNs
Please help me to come out of this problem.

Thanks
Omkar B

On Thu, Nov 1, 2018 at 1:11 AM Julien Grall <julien.grall@arm.com> wrote:

>
>
> On 10/17/18 1:24 PM, Omkar Bolla wrote:
> > Hi,
>
> Hi Omkar,
>
> > I have started finding which patch introduced Armv8 Secondary CPUs issue.
> >
> > I just want to start PV vdevb before domainU debian rootfs mount. Is it
> > possible?
>
> May I ask why you need the dependency on the rootfs?
>
> Cheers,
>
> --
> Julien Grall
>

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

--0000000000006a8932057996dbaf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">Hi,</=
div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)"><br></div><=
div class=3D"gmail_default" style=3D"color:rgb(11,83,148)"><span style=3D"c=
olor:rgb(34,34,34)">&gt; May I ask why you need the dependency on the rootf=
s?</span><br></div><div class=3D"gmail_default"><div class=3D"gmail_default=
" style=3D"color:rgb(11,83,148)"><br></div><div class=3D"gmail_default" sty=
le=3D"color:rgb(11,83,148)">I am trying to pass-through the display to gues=
t domain. to do through driver needs clocks. I have written simple basic cl=
ock pv frontend and backend.</div><div class=3D"gmail_default" style=3D"col=
or:rgb(11,83,148)">So I thought these clocks must be initialised before dis=
play driver initialisation.=C2=A0</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)"><br></div><div class=3D"gmail_default" style=3D"c=
olor:rgb(11,83,148)">But if I start both domain and clocks script one after=
 another, clock got initialised properly. Problem solved.</div><div class=
=3D"gmail_default" style=3D"color:rgb(11,83,148)">But still i have some dou=
bt, is it possible to do some thing in xenbits src to start automatically w=
hen we start underprivileged domain?</div><div class=3D"gmail_default" styl=
e=3D"color:rgb(11,83,148)"><br></div><div class=3D"gmail_default" style=3D"=
color:rgb(11,83,148)">I have one more question about pass-through</div><div=
 class=3D"gmail_default" style=3D"color:rgb(11,83,148)">To implement pass t=
hrough I took reference from below link</div><div class=3D"gmail_default"><=
font color=3D"#0b5394"><a href=3D"https://wiki.xen.org/images/1/17/Device_p=
assthrough_xen.pdf">https://wiki.xen.org/images/1/17/Device_passthrough_xen=
.pdf</a></font><br></div><div class=3D"gmail_default"><br></div><div class=
=3D"gmail_default"><div class=3D"gmail_default" style=3D"color:rgb(11,83,14=
8)">I added &#39;xen-passthrough&#39; to actual dom0 dtb and created new dt=
b with below nodes in passthrough node</div><div class=3D"gmail_default"><d=
iv class=3D"gmail_default"><div class=3D"gmail_default"><span style=3D"colo=
r:rgb(11,83,148)">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D</span><font color=3D"#0b5394"><br></font></div><div c=
lass=3D"gmail_default"><font color=3D"#0b5394"><span style=3D"white-space:p=
re">		</span>dpe: dpe@10004000 {</font></div><div class=3D"gmail_default"><=
font color=3D"#0b5394"><span style=3D"white-space:pre">			</span>compatible=
 =3D &quot;hisilicon,hi3660-dpe&quot;;</font></div><div class=3D"gmail_defa=
ult"><font color=3D"#0b5394"><span style=3D"white-space:pre">			</span>stat=
us =3D &quot;ok&quot;;</font></div><div class=3D"gmail_default"><font color=
=3D"#0b5394">#if 0</font></div><div class=3D"gmail_default"><font color=3D"=
#0b5394">//ACTUAL REG PROPERTY of DISPLAY</font></div><div class=3D"gmail_d=
efault"><font color=3D"#0b5394">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x0 0xE8600000 0x0 0x=
80000&gt;,</font></div><div class=3D"gmail_default"><font color=3D"#0b5394"=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;0x0 =
0xFFF35000 0 0x1000&gt;,</font></div><div class=3D"gmail_default"><font col=
or=3D"#0b5394">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &lt;0x0 0xFFF0A000 0 0x1000&gt;,</font></div><div class=3D"gmail_def=
ault"><font color=3D"#0b5394">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &lt;0x0 0xFFF31000 0 0x1000&gt;,</font></div><div clas=
s=3D"gmail_default"><font color=3D"#0b5394">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;0x0 0xE86C0000 0 0x10000&gt;;</font>=
</div><div class=3D"gmail_default"><font color=3D"#0b5394">#endif</font></d=
iv><div class=3D"gmail_default"><font color=3D"#0b5394"><span style=3D"whit=
e-space:pre">			</span>//reg =3D &lt;0x0 0x10004000 0x0 0x80000&gt;,</font>=
</div><div class=3D"gmail_default"><font color=3D"#0b5394"><span style=3D"w=
hite-space:pre">			</span>reg =3D &lt;0x0 0x10004000 0x0 0x80000&gt;,</font=
></div><div class=3D"gmail_default"><font color=3D"#0b5394"><span style=3D"=
white-space:pre">			</span>=C2=A0 =C2=A0 =C2=A0 &lt;0x0 0x10084000 0 0x1000=
&gt;,</font></div><div class=3D"gmail_default"><font color=3D"#0b5394"><spa=
n style=3D"white-space:pre">			</span>=C2=A0 =C2=A0 =C2=A0 &lt;0x0 0x100850=
00 0 0x1000&gt;,</font></div><div class=3D"gmail_default"><font color=3D"#0=
b5394"><span style=3D"white-space:pre">			</span>=C2=A0 =C2=A0 =C2=A0 &lt;0=
x0 0x10086000 0 0x1000&gt;,</font></div><div class=3D"gmail_default"><font =
color=3D"#0b5394"><span style=3D"white-space:pre">			</span>=C2=A0 =C2=A0 =
=C2=A0 &lt;0x0 0x100C4000 0 0x10000&gt;;</font></div><div class=3D"gmail_de=
fault"><font color=3D"#0b5394">//<span style=3D"white-space:pre">			</span>=
=C2=A0 =C2=A0 =C2=A0 &lt;0x0 0x10087000 0 0x10000&gt;;</font></div><div cla=
ss=3D"gmail_default"><font color=3D"#0b5394"><br></font></div><div class=3D=
"gmail_default"><font color=3D"#0b5394"><span style=3D"white-space:pre">			=
</span>interrupts =3D &lt;0 245 4&gt;;</font></div><div class=3D"gmail_defa=
ult"><font color=3D"#0b5394"><br></font></div><div class=3D"gmail_default">=
<font color=3D"#0b5394"><span style=3D"white-space:pre">			</span>clocks =
=3D &lt;&amp;clk_xen HI3660_ACLK_GATE_DSS&gt;,</font></div><div class=3D"gm=
ail_default"><font color=3D"#0b5394"><span style=3D"white-space:pre">				</=
span>&lt;&amp;clk_xen HI3660_PCLK_GATE_DSS&gt;,</font></div><div class=3D"g=
mail_default"><font color=3D"#0b5394"><span style=3D"white-space:pre">				<=
/span>&lt;&amp;clk_xen HI3660_CLK_GATE_EDC0&gt;,</font></div><div class=3D"=
gmail_default"><font color=3D"#0b5394"><span style=3D"white-space:pre">				=
</span>&lt;&amp;clk_xen HI3660_CLK_GATE_LDI0&gt;,</font></div><div class=3D=
"gmail_default"><font color=3D"#0b5394"><span style=3D"white-space:pre">			=
	</span>&lt;&amp;clk_xen HI3660_CLK_GATE_LDI1&gt;,</font></div><div class=
=3D"gmail_default"><font color=3D"#0b5394"><span style=3D"white-space:pre">=
				</span>&lt;&amp;clk_xen HI3660_CLK_GATE_DSS_AXI_MM&gt;,</font></div><di=
v class=3D"gmail_default"><font color=3D"#0b5394"><span style=3D"white-spac=
e:pre">				</span>&lt;&amp;clk_xen HI3660_PCLK_GATE_MMBUF&gt;;</font></div>=
<div class=3D"gmail_default"><font color=3D"#0b5394"><span style=3D"white-s=
pace:pre">			</span>clock-names =3D &quot;aclk_dss&quot;,</font></div><div =
class=3D"gmail_default"><font color=3D"#0b5394"><span style=3D"white-space:=
pre">					</span>&quot;pclk_dss&quot;,</font></div><div class=3D"gmail_defa=
ult"><font color=3D"#0b5394"><span style=3D"white-space:pre">					</span>&q=
uot;clk_edc0&quot;,</font></div><div class=3D"gmail_default"><font color=3D=
"#0b5394"><span style=3D"white-space:pre">					</span>&quot;clk_ldi0&quot;,=
</font></div><div class=3D"gmail_default"><font color=3D"#0b5394"><span sty=
le=3D"white-space:pre">					</span>&quot;clk_ldi1&quot;,</font></div><div c=
lass=3D"gmail_default"><font color=3D"#0b5394"><span style=3D"white-space:p=
re">					</span>&quot;clk_dss_axi_mm&quot;,</font></div><div class=3D"gmail=
_default"><font color=3D"#0b5394"><span style=3D"white-space:pre">					</sp=
an>&quot;pclk_mmbuf&quot;;</font></div><div class=3D"gmail_default"><font c=
olor=3D"#0b5394"><br></font></div><div class=3D"gmail_default"><font color=
=3D"#0b5394"><span style=3D"white-space:pre">			</span>dma-coherent;</font>=
</div><div class=3D"gmail_default"><font color=3D"#0b5394"><br></font></div=
><div class=3D"gmail_default"><font color=3D"#0b5394"><span style=3D"white-=
space:pre">			</span>port {</font></div><div class=3D"gmail_default"><font =
color=3D"#0b5394"><span style=3D"white-space:pre">				</span>dpe_out: endpo=
int {</font></div><div class=3D"gmail_default"><font color=3D"#0b5394"><spa=
n style=3D"white-space:pre">					</span>remote-endpoint =3D &lt;&amp;dsi_in=
&gt;;</font></div><div class=3D"gmail_default"><font color=3D"#0b5394"><spa=
n style=3D"white-space:pre">				</span>};</font></div><div class=3D"gmail_d=
efault"><font color=3D"#0b5394"><span style=3D"white-space:pre">			</span>}=
;</font></div><div class=3D"gmail_default"><font color=3D"#0b5394"><span st=
yle=3D"white-space:pre">		</span>};</font></div><div class=3D"gmail_default=
"><font color=3D"#0b5394"><br></font></div><div class=3D"gmail_default"><fo=
nt color=3D"#0b5394"><span style=3D"white-space:pre">		</span>dsi: dsi@1009=
7000 {</font></div><div class=3D"gmail_default"><font color=3D"#0b5394"><sp=
an style=3D"white-space:pre">			</span>compatible =3D &quot;hisilicon,hi366=
0-dsi&quot;;</font></div><div class=3D"gmail_default"><font color=3D"#0b539=
4"><span style=3D"white-space:pre">			</span>status =3D &quot;ok&quot;;</fo=
nt></div><div class=3D"gmail_default"><font color=3D"#0b5394">#if 0</font><=
/div><div class=3D"gmail_default"><font color=3D"#0b5394">//ACTUAL REG PROP=
ERTY of DISPLAY</font></div><div class=3D"gmail_default"><font color=3D"#0b=
5394"><span style=3D"white-space:pre">			</span>reg =3D &lt;0 0xE8601000 0 =
0x7F000&gt;,</font></div><div class=3D"gmail_default"><font color=3D"#0b539=
4">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;0=
 0xFFF35000 0 0x1000&gt;;</font></div><div class=3D"gmail_default"><font co=
lor=3D"#0b5394">#endif</font></div><div class=3D"gmail_default"><font color=
=3D"#0b5394"><span style=3D"white-space:pre">		</span>//<span style=3D"whit=
e-space:pre">	</span>reg =3D &lt;0 0x10097000 0 0x7F000&gt;,</font></div><d=
iv class=3D"gmail_default"><font color=3D"#0b5394"><span style=3D"white-spa=
ce:pre">		</span>//<span style=3D"white-space:pre">			</span>&lt;0 0x101160=
00 0 0x1000&gt;;</font></div><div class=3D"gmail_default"><font color=3D"#0=
b5394"><span style=3D"white-space:pre">			</span>reg =3D &lt;0 0x10004000 0=
 0x80000&gt;,</font></div><div class=3D"gmail_default"><font color=3D"#0b53=
94"><span style=3D"white-space:pre">					</span>&lt;0 0x10084000 0 0x1000&g=
t;;</font></div><div class=3D"gmail_default"><font color=3D"#0b5394"><br></=
font></div><div class=3D"gmail_default"><font color=3D"#0b5394"><span style=
=3D"white-space:pre">			</span>clocks =3D &lt;&amp;clk_xen HI3660_CLK_GATE_=
TXDPHY0_REF&gt;,</font></div><div class=3D"gmail_default"><font color=3D"#0=
b5394"><span style=3D"white-space:pre">					</span>&lt;&amp;clk_xen HI3660_=
CLK_GATE_TXDPHY1_REF&gt;,</font></div><div class=3D"gmail_default"><font co=
lor=3D"#0b5394"><span style=3D"white-space:pre">					</span>&lt;&amp;clk_xe=
n HI3660_CLK_GATE_TXDPHY0_CFG&gt;,</font></div><div class=3D"gmail_default"=
><font color=3D"#0b5394"><span style=3D"white-space:pre">					</span>&lt;&a=
mp;clk_xen HI3660_CLK_GATE_TXDPHY1_CFG&gt;,</font></div><div class=3D"gmail=
_default"><font color=3D"#0b5394"><span style=3D"white-space:pre">					</sp=
an>&lt;&amp;clk_xen HI3660_PCLK_GATE_DSI0&gt;,</font></div><div class=3D"gm=
ail_default"><font color=3D"#0b5394"><span style=3D"white-space:pre">					<=
/span>&lt;&amp;clk_xen HI3660_PCLK_GATE_DSI1&gt;;</font></div><div class=3D=
"gmail_default"><font color=3D"#0b5394"><span style=3D"white-space:pre">			=
</span>clock-names =3D &quot;clk_txdphy0_ref&quot;,</font></div><div class=
=3D"gmail_default"><font color=3D"#0b5394"><span style=3D"white-space:pre">=
						</span>&quot;clk_txdphy1_ref&quot;,</font></div><div class=3D"gmail_d=
efault"><font color=3D"#0b5394"><span style=3D"white-space:pre">						</spa=
n>&quot;clk_txdphy0_cfg&quot;,</font></div><div class=3D"gmail_default"><fo=
nt color=3D"#0b5394"><span style=3D"white-space:pre">						</span>&quot;clk=
_txdphy1_cfg&quot;,</font></div><div class=3D"gmail_default"><font color=3D=
"#0b5394"><span style=3D"white-space:pre">						</span>&quot;pclk_dsi0&quot=
;,</font></div><div class=3D"gmail_default"><font color=3D"#0b5394"><span s=
tyle=3D"white-space:pre">						</span>&quot;pclk_dsi1&quot;;</font></div><d=
iv class=3D"gmail_default"><font color=3D"#0b5394"><br></font></div><div cl=
ass=3D"gmail_default"><font color=3D"#0b5394"><span style=3D"white-space:pr=
e">			</span>#address-cells =3D &lt;1&gt;;</font></div><div class=3D"gmail_=
default"><font color=3D"#0b5394"><span style=3D"white-space:pre">			</span>=
#size-cells =3D &lt;0&gt;;</font></div><div class=3D"gmail_default"><font c=
olor=3D"#0b5394"><br></font></div><div class=3D"gmail_default"><font color=
=3D"#0b5394"><span style=3D"white-space:pre">		</span>};</font></div><div c=
lass=3D"gmail_default"><font color=3D"#0b5394">#endif</font></div><div clas=
s=3D"gmail_default"><font color=3D"#0b5394"><span style=3D"white-space:pre"=
>		</span>clocks {</font></div><div class=3D"gmail_default"><font color=3D"=
#0b5394"><span style=3D"white-space:pre">			</span>compatible =3D &quot;sim=
ple-bus&quot;;</font></div><div class=3D"gmail_default"><font color=3D"#0b5=
394"><span style=3D"white-space:pre">			</span>#address-cells =3D &lt;2&gt;=
;</font></div><div class=3D"gmail_default"><font color=3D"#0b5394"><span st=
yle=3D"white-space:pre">			</span>#size-cells =3D &lt;2&gt;;</font></div><d=
iv class=3D"gmail_default"><font color=3D"#0b5394"><span style=3D"white-spa=
ce:pre">			</span>ranges;</font></div><div class=3D"gmail_default"><font co=
lor=3D"#0b5394"><span style=3D"white-space:pre">			</span>clk_xen: xen_clk@=
0 {</font></div><div class=3D"gmail_default"><font color=3D"#0b5394"><span =
style=3D"white-space:pre">				</span>compatible =3D &quot;xen,xen-vclk&quot=
;;</font></div><div class=3D"gmail_default"><font color=3D"#0b5394"><span s=
tyle=3D"white-space:pre">				</span>#clock-cells =3D &lt;1&gt;;</font></div=
><div class=3D"gmail_default"><font color=3D"#0b5394"><span style=3D"white-=
space:pre">			</span>};</font></div><div class=3D"gmail_default"><font colo=
r=3D"#0b5394"><span style=3D"white-space:pre">		</span>};</font></div><div =
class=3D"gmail_default"><span style=3D"color:rgb(11,83,148)">=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span><f=
ont color=3D"#0b5394"><br></font></div><div class=3D"gmail_default"><font c=
olor=3D"#0b5394">Below is my &#39;debian.cfg&#39; file:</font></div><div cl=
ass=3D"gmail_default"><span style=3D"color:rgb(11,83,148)">=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span><font=
 color=3D"#0b5394"><br></font></div><div class=3D"gmail_default"><font colo=
r=3D"#0b5394"><div class=3D"gmail_default">kernel =3D &quot;/debian/Image&q=
uot;</div><div class=3D"gmail_default">device_tree=3D&quot;/debian/domu.dtb=
&quot;</div><div class=3D"gmail_default">memory =3D 512</div><div class=3D"=
gmail_default">vcpus =3D 8</div><div class=3D"gmail_default">cpus =3D &quot=
;all&quot;</div><div class=3D"gmail_default">name=3D&quot;debian&quot;</div=
><div class=3D"gmail_default"><br></div><div class=3D"gmail_default">######=
########### DPE ################</div><div class=3D"gmail_default">#iomem =
=3D [ &quot;0xE8600,0x80@0x10004&quot;, &quot;0xFFF35,1@0x10084&quot;, &quo=
t;0xFFF0A,1@0x10085&quot;, &quot;0xFFF31,1@0x10086&quot;, &quot;0xE86C0,10@=
0x10087&quot;]</div><div class=3D"gmail_default">#iomem =3D [ &quot;0xE8600=
,0x80&quot;, &quot;0xFFF35,1&quot;, &quot;0xFFF0A,1&quot;, &quot;0xFFF31,1&=
quot;, &quot;0xE86C0,10&quot;]</div><div class=3D"gmail_default">irqs =3D [=
 277 ]</div><div class=3D"gmail_default"><br></div><div class=3D"gmail_defa=
ult">iomem =3D [ &quot;0xE8600,80@0x10004&quot; ]</div><div class=3D"gmail_=
default"><br></div><div class=3D"gmail_default">iomem =3D [ &quot;0xFFF35,1=
@0x10084&quot; ]</div><div class=3D"gmail_default">iomem =3D [ &quot;0xFFF0=
A,1@0x10085&quot; ]</div><div class=3D"gmail_default">iomem =3D [ &quot;0xF=
FF31,1@0x10086&quot; ]</div><div class=3D"gmail_default">iomem =3D [ &quot;=
0xE86C0,10@0x100C4&quot;]</div><div class=3D"gmail_default">#iomem =3D [ &q=
uot;0xE86C0,10@0x10087&quot;]</div><div class=3D"gmail_default">#iomem =3D =
[ &quot;0xE8600,80@0x00000&quot; ]</div><div class=3D"gmail_default"><br></=
div><div class=3D"gmail_default">################# DPE ################</di=
v><div class=3D"gmail_default">################# DSI ################</div>=
<div class=3D"gmail_default">#iomem =3D [ &quot;0xE8601,0x7F&quot;, &quot;0=
xFFF35,1&quot;]</div><div class=3D"gmail_default">#iomem =3D [ &quot;0xE860=
1,0x7F@0x10097&quot;, &quot;0xFFF35,1@0x10116&quot;, &quot;0xE8601,0x7F@0x1=
0195&quot;]</div><div class=3D"gmail_default"><br></div><div class=3D"gmail=
_default">#iomem =3D [ &quot;0xE8601,7F@0x10097&quot; ]</div><div class=3D"=
gmail_default">#iomem =3D [ &quot;0xFFF35,1@0x10116&quot; ]</div><div class=
=3D"gmail_default"><br></div><div class=3D"gmail_default"><br></div><div cl=
ass=3D"gmail_default">iomem =3D [ &quot;0xE8601,7F@0x10005&quot; ]</div><di=
v class=3D"gmail_default">iomem =3D [ &quot;0xFFF35,1@0x10084&quot; ]</div>=
<div class=3D"gmail_default">################# DSI ################</div><d=
iv class=3D"gmail_default"><br></div><div class=3D"gmail_default">#vif =3D =
[&#39;mac=3D00:16:3e:64:b8:40,bridge=3Dxenbr0&#39;]</div><div class=3D"gmai=
l_default">#nics =3D 1</div><div class=3D"gmail_default">#vif =3D [ &#39;et=
h0=3D00:60:00:00:00:01&#39; ]</div><div class=3D"gmail_default"><br></div><=
div class=3D"gmail_default">disk =3D [&#39;/dev/loop1,raw,xvda,w&#39;]</div=
><div class=3D"gmail_default">extra =3D &quot;earlyprintk=3Dxenboot console=
=3Dhvc0 root=3D/dev/xvda rootfstype=3Dext4 rw video=3DHDMI-A-1:1280x720@60&=
quot;</div><div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D</div></font></div><div class=3D"gmail_default"><font =
color=3D"#0b5394">Here I am using same io space(GFNs) for DPE and DSI nodes=
, and having same below error</font></div><div class=3D"gmail_default"><fon=
t color=3D"#0b5394">and tried with different GFNs and giving same error.</f=
ont></div><div class=3D"gmail_default"><font color=3D"#0b5394"><br></font><=
/div><div class=3D"gmail_default"><font color=3D"#0b5394">But adding this, =
Every thing is good but when i am trying to remap iomem second time, having=
 below error</font></div><div class=3D"gmail_default"><span style=3D"color:=
rgb(11,83,148)">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D</span><font color=3D"#0b5394"><br></font></div><div c=
lass=3D"gmail_default"><font color=3D"#0b5394"><div class=3D"gmail_default"=
>[=C2=A0 =C2=A0 3.215021] OF: rrrrrrrrrrrr: start: 0x10004000, sz =3D 0x800=
00</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 3.215062] [DISPLAY] dsi=
_parse_dt(): 1536: of device: /passthrough/dsi@10097000</div><div class=3D"=
gmail_default">[=C2=A0 =C2=A0 3.215083] [DISPLAY] dsi_parse_dt(): 1537: +++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++</div><div cl=
ass=3D"gmail_default">[=C2=A0 =C2=A0 3.215108] [DISPLAY] dsi_parse_dt(): 15=
40: ctx-&gt;base: ffffff800bd01000</div><div class=3D"gmail_default">[=C2=
=A0 =C2=A0 3.215126] [DISPLAY] dsi_parse_dt(): 1541:=C2=A0</div><div class=
=3D"gmail_default">[=C2=A0 =C2=A0 3.215136] OF: rrrrrrrrrrrr: start: 0x1008=
4000, sz =3D 0x1000</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 3.2151=
69] [DISPLAY] dsi_parse_dt(): 1548:=C2=A0</div><div class=3D"gmail_default"=
>[=C2=A0 =C2=A0 4.159087] [DISPLAY] dsi_parse_dt(): 1563:=C2=A0</div><div c=
lass=3D"gmail_default">[=C2=A0 =C2=A0 4.159092] [DISPLAY] dsi_parse_dt(): 1=
568:=C2=A0</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.159132] [D][X=
EN_VCLK]xen_vclk_xfer(): 163: buffer: clk_txdphy0_ref,1</div><div class=3D"=
gmail_default">[=C2=A0 =C2=A0 4.159163] [D][XEN_VCLK]xen_vclk_xfer(): 164: =
*******************************************</div><div class=3D"gmail_defaul=
t">[=C2=A0 =C2=A0 4.159399] [D][XEN_VCLK]xen_vclk_xfer(): 170: ************=
*******************************</div><div class=3D"gmail_default">[=C2=A0 =
=C2=A0 4.159626] [D][XEN_VCLK]xen_vclk_xfer(): 176: Sending IRQ_DATA to dom=
ain-0</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.160218] [D][XEN_VC=
LK]xen_vclk_interrupt(): 446: IRQ(13) from domain 0 fired!!!</div><div clas=
s=3D"gmail_default">[=C2=A0 =C2=A0 4.160359] [D][XEN_VCLK]vclk_fe_bh(): 394=
: irq_status: 0x3</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.160532=
] [D][XEN_VCLK]vclk_fe_bh(): 407: ACK Recieved from dom-0</div><div class=
=3D"gmail_default">[=C2=A0 =C2=A0 4.160542] [D][XEN_VCLK]xen_vclk_xfer(): 1=
79: Xfer Done</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.160545] [D=
][XEN_VCLK]xen_of_clk_src_onecell_get(): 286:=C2=A0 Xfer done...</div><div =
class=3D"gmail_default">[=C2=A0 =C2=A0 4.160554] [DISPLAY] dsi_parse_dt(): =
1575:=C2=A0</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.160560] [D][=
XEN_VCLK]vclk_round_rate(): 224:=C2=A0 called...</div><div class=3D"gmail_d=
efault">[=C2=A0 =C2=A0 4.160567] [D][XEN_VCLK]xen_vclk_xfer(): 163: buffer:=
 clk_txdphy0_ref,4,19200000</div><div class=3D"gmail_default">[=C2=A0 =C2=
=A0 4.160570] [D][XEN_VCLK]xen_vclk_xfer(): 164: **************************=
*****************</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.161095=
] [D][XEN_VCLK]xen_vclk_xfer(): 170: **************************************=
*****</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.161331] [D][XEN_VC=
LK]xen_vclk_xfer(): 176: Sending IRQ_DATA to domain-0</div><div class=3D"gm=
ail_default">[=C2=A0 =C2=A0 4.161946] [D][XEN_VCLK]xen_vclk_interrupt(): 44=
6: IRQ(13) from domain 0 fired!!!</div><div class=3D"gmail_default">[=C2=A0=
 =C2=A0 4.162120] [D][XEN_VCLK]vclk_fe_bh(): 394: irq_status: 0x3</div><div=
 class=3D"gmail_default">[=C2=A0 =C2=A0 4.162284] [D][XEN_VCLK]vclk_fe_bh()=
: 407: ACK Recieved from dom-0</div><div class=3D"gmail_default">[=C2=A0 =
=C2=A0 4.162295] [D][XEN_VCLK]xen_vclk_xfer(): 179: Xfer Done</div><div cla=
ss=3D"gmail_default">[=C2=A0 =C2=A0 4.162301] [DISPLAY] dsi_parse_dt(): 158=
3:=C2=A0</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.162314] [D][XEN=
_VCLK]xen_vclk_xfer(): 163: buffer: clk_txdphy0_cfg,1</div><div class=3D"gm=
ail_default">[=C2=A0 =C2=A0 4.162316] [D][XEN_VCLK]xen_vclk_xfer(): 164: **=
*****************************************</div><div class=3D"gmail_default"=
>[=C2=A0 =C2=A0 4.162641] [D][XEN_VCLK]xen_vclk_xfer(): 170: **************=
*****************************</div><div class=3D"gmail_default">[=C2=A0 =C2=
=A0 4.162984] [D][XEN_VCLK]xen_vclk_xfer(): 176: Sending IRQ_DATA to domain=
-0</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.163596] [D][XEN_VCLK]=
xen_vclk_interrupt(): 446: IRQ(13) from domain 0 fired!!!</div><div class=
=3D"gmail_default">[=C2=A0 =C2=A0 4.167753] [D][XEN_VCLK]vclk_fe_bh(): 394:=
 irq_status: 0x3</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.167955]=
 [D][XEN_VCLK]vclk_fe_bh(): 407: ACK Recieved from dom-0</div><div class=3D=
"gmail_default">[=C2=A0 =C2=A0 4.167968] [D][XEN_VCLK]xen_vclk_xfer(): 179:=
 Xfer Done</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.167971] [D][X=
EN_VCLK]xen_of_clk_src_onecell_get(): 286:=C2=A0 Xfer done...</div><div cla=
ss=3D"gmail_default">[=C2=A0 =C2=A0 4.167979] [DISPLAY] dsi_parse_dt(): 159=
3:=C2=A0</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.167982] [D][XEN=
_VCLK]vclk_round_rate(): 224:=C2=A0 called...</div><div class=3D"gmail_defa=
ult">[=C2=A0 =C2=A0 4.167985] [D][XEN_VCLK]xen_vclk_xfer(): 163: buffer: cl=
k_txdphy0_cfg,4,19200000</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4=
.167992] [D][XEN_VCLK]xen_vclk_xfer(): 164: *******************************=
************</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.168244] [D]=
[XEN_VCLK]xen_vclk_xfer(): 170: *******************************************=
</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.168476] [D][XEN_VCLK]xe=
n_vclk_xfer(): 176: Sending IRQ_DATA to domain-0</div><div class=3D"gmail_d=
efault">[=C2=A0 =C2=A0 4.169101] [D][XEN_VCLK]xen_vclk_interrupt(): 446: IR=
Q(13) from domain 0 fired!!!</div><div class=3D"gmail_default">[=C2=A0 =C2=
=A0 4.169262] [D][XEN_VCLK]vclk_fe_bh(): 394: irq_status: 0x3</div><div cla=
ss=3D"gmail_default">[=C2=A0 =C2=A0 4.169448] [D][XEN_VCLK]vclk_fe_bh(): 40=
7: ACK Recieved from dom-0</div><div class=3D"gmail_default">[=C2=A0 =C2=A0=
 4.169491] [D][XEN_VCLK]xen_vclk_xfer(): 179: Xfer Done</div><div class=3D"=
gmail_default">[=C2=A0 =C2=A0 4.169510] [DISPLAY] dsi_parse_dt(): 1601:=C2=
=A0</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.169535] [D][XEN_VCLK=
]xen_vclk_xfer(): 163: buffer: pclk_dsi0,1</div><div class=3D"gmail_default=
">[=C2=A0 =C2=A0 4.169554] [D][XEN_VCLK]xen_vclk_xfer(): 164: *************=
******************************</div><div class=3D"gmail_default">[=C2=A0 =
=C2=A0 4.169803] [D][XEN_VCLK]xen_vclk_xfer(): 170: ***********************=
********************</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.170=
019] [D][XEN_VCLK]xen_vclk_xfer(): 176: Sending IRQ_DATA to domain-0</div><=
div class=3D"gmail_default">[=C2=A0 =C2=A0 4.170619] [D][XEN_VCLK]xen_vclk_=
interrupt(): 446: IRQ(13) from domain 0 fired!!!</div><div class=3D"gmail_d=
efault">[=C2=A0 =C2=A0 4.170779] [D][XEN_VCLK]vclk_fe_bh(): 394: irq_status=
: 0x3</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.170965] [D][XEN_VC=
LK]vclk_fe_bh(): 407: ACK Recieved from dom-0</div><div class=3D"gmail_defa=
ult">[=C2=A0 =C2=A0 4.170978] [D][XEN_VCLK]xen_vclk_xfer(): 179: Xfer Done<=
/div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.170981] [D][XEN_VCLK]xen=
_of_clk_src_onecell_get(): 286:=C2=A0 Xfer done...</div><div class=3D"gmail=
_default">[=C2=A0 =C2=A0 4.170989] [DISPLAY] dsi_parse_dt(): 1611:=C2=A0</d=
iv><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.170992] [DISPLAY] dsi_prob=
e(): 1654: Before component add</div><div class=3D"gmail_default">[=C2=A0 =
=C2=A0 4.170997] [DISPLAY] compare_of(): 242:=C2=A0</div><div class=3D"gmai=
l_default">[=C2=A0 =C2=A0 4.171002] [DISPLAY] kirin_drm_bind(): 257:=C2=A0<=
/div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.171004] [drm] +.=C2=A0</=
div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.171386] [DISPLAY] kirin_d=
rm_kms_init(): 105:=C2=A0</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 =
4.171391] [drm] +.</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.21254=
3] [DISPLAY] kirin_drm_mode_config_init(): 91:=C2=A0</div><div class=3D"gma=
il_default">[=C2=A0 =C2=A0 4.212547] [DISPLAY] dss_drm_init(): 638:=C2=A0</=
div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.212563] [drm] +.</div><di=
v class=3D"gmail_default">[=C2=A0 =C2=A0 4.212585] [DISPLAY] dss_dts_parse(=
): 513:=C2=A0</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.212603] [D=
ISPLAY] dss_dts_parse(): 530: of device: /passthrough/dpe@10004000</div><di=
v class=3D"gmail_default">[=C2=A0 =C2=A0 4.212635] [DISPLAY] dss_dts_parse(=
): 531: ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.212661] [DISPL=
AY] dss_dts_parse(): 532: ctx-&gt;base: ffffff800bd00000</div><div class=3D=
"gmail_default">[=C2=A0 =C2=A0 4.212688] Unhandled fault: ttbr address size=
 fault (0x96000000) at 0xffffff800bd01000</div><div class=3D"gmail_default"=
>[=C2=A0 =C2=A0 4.212708] Mem abort info:</div><div class=3D"gmail_default"=
>[=C2=A0 =C2=A0 4.212720]=C2=A0 =C2=A0Exception class =3D DABT (current EL)=
, IL =3D 32 bits</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.212738]=
=C2=A0 =C2=A0SET =3D 0, FnV =3D 0</div><div class=3D"gmail_default">[=C2=A0=
 =C2=A0 4.212751]=C2=A0 =C2=A0EA =3D 0, S1PTW =3D 0</div><div class=3D"gmai=
l_default">[=C2=A0 =C2=A0 4.212763] Data abort info:</div><div class=3D"gma=
il_default">[=C2=A0 =C2=A0 4.212776]=C2=A0 =C2=A0ISV =3D 0, ISS =3D 0x00000=
000</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.212789]=C2=A0 =C2=A0=
CM =3D 0, WnR =3D 0</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.2128=
06] Internal error: : 96000000 [#1] PREEMPT SMP</div><div class=3D"gmail_de=
fault">[=C2=A0 =C2=A0 4.212821] Modules linked in:</div><div class=3D"gmail=
_default">[=C2=A0 =C2=A0 4.212839] CPU: 7 PID: 99 Comm: kworker/7:1 Tainted=
: G S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4.14.0-rc7 #456</div>=
<div class=3D"gmail_default">[=C2=A0 =C2=A0 4.212857] Hardware name: XENVM-=
4.8 (DT)</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.212878] Workque=
ue: events deferred_probe_work_func</div><div class=3D"gmail_default">[=C2=
=A0 =C2=A0 4.212893] task: ffffffc01abe6000 task.stack: ffffff8009878000</d=
iv><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.212916] PC is at dss_drm_i=
nit+0x1a8/0x680</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.212931] =
LR is at dss_drm_init+0x1a0/0x680</div><div class=3D"gmail_default">[=C2=A0=
 =C2=A0 4.212945] pc : [&lt;ffffff80087061d0&gt;] lr : [&lt;ffffff80087061c=
8&gt;] pstate: 40000045</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.=
212963] sp : ffffff800987ba20</div><div class=3D"gmail_default">[=C2=A0 =C2=
=A0 4.212973] x29: ffffff800987ba30 x28: ffffffc01bff42e8=C2=A0</div><div c=
lass=3D"gmail_default">[=C2=A0 =C2=A0 4.212990] x27: ffffff800bd01000 x26: =
ffffffc018d25760=C2=A0</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.2=
13006] x25: ffffff80090f8c70 x24: ffffffc017212800=C2=A0</div><div class=3D=
"gmail_default">[=C2=A0 =C2=A0 4.213023] x23: ffffff8008e32000 x22: ffffff8=
0090f8000=C2=A0</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.213039] =
x21: ffffff8008e32748 x20: ffffffc018d25018=C2=A0</div><div class=3D"gmail_=
default">[=C2=A0 =C2=A0 4.213055] x19: ffffffc01abdf810 x18: 00000000000000=
10=C2=A0</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.213071] x17: 00=
0000000000000e x16: 0000000000000020=C2=A0</div><div class=3D"gmail_default=
">[=C2=A0 =C2=A0 4.213087] x15: ffffffffffffffff x14: ffffff80894c6157=C2=
=A0</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.213104] x13: ffffff8=
0094c6165 x12: ffffff8009379000=C2=A0</div><div class=3D"gmail_default">[=
=C2=A0 =C2=A0 4.213120] x11: 0000000005f5e0ff x10: ffffff800987b6f0=C2=A0</=
div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.257555] x9 : 00000000ffff=
ffd0 x8 : 000000000000004b=C2=A0</div><div class=3D"gmail_default">[=C2=A0 =
=C2=A0 4.257573] x7 : 000000000000000c x6 : 00000000000001ee=C2=A0</div><di=
v class=3D"gmail_default">[=C2=A0 =C2=A0 4.257591] x5 : 0000000000007ceb x4=
 : 0000000000000000=C2=A0</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 =
4.257608] x3 : ffffff800934a000 x2 : 0000000000000000=C2=A0</div><div class=
=3D"gmail_default">[=C2=A0 =C2=A0 4.257625] x1 : 0000000000000000 x0 : 0000=
00000000003b=C2=A0</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.25764=
4] Process kworker/7:1 (pid: 99, stack limit =3D 0xffffff8009878000)</div><=
div class=3D"gmail_default">[=C2=A0 =C2=A0 4.257661] Call trace:</div><div =
class=3D"gmail_default">[=C2=A0 =C2=A0 4.257672] Exception stack(0xffffff80=
0987b8e0 to 0xffffff800987ba20)</div><div class=3D"gmail_default">[=C2=A0 =
=C2=A0 4.257691] b8e0: 000000000000003b 0000000000000000 0000000000000000 f=
fffff800934a000</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.257713] =
b900: 0000000000000000 0000000000007ceb 00000000000001ee 000000000000000c</=
div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.257734] b920: 00000000000=
0004b 00000000ffffffd0 ffffff800987b6f0 0000000005f5e0ff</div><div class=3D=
"gmail_default">[=C2=A0 =C2=A0 4.257756] b940: ffffff8009379000 ffffff80094=
c6165 ffffff80894c6157 ffffffffffffffff</div><div class=3D"gmail_default">[=
=C2=A0 =C2=A0 4.257777] b960: 0000000000000020 000000000000000e 00000000000=
00010 ffffffc01abdf810</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.2=
57799] b980: ffffffc018d25018 ffffff8008e32748 ffffff80090f8000 ffffff8008e=
32000</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.257821] b9a0: ffff=
ffc017212800 ffffff80090f8c70 ffffffc018d25760 ffffff800bd01000</div><div c=
lass=3D"gmail_default">[=C2=A0 =C2=A0 4.257842] b9c0: ffffffc01bff42e8 ffff=
ff800987ba30 ffffff80087061c8 ffffff800987ba20</div><div class=3D"gmail_def=
ault">[=C2=A0 =C2=A0 4.257864] b9e0: ffffff80087061d0 0000000040000045 0000=
000000000214 ffffff800bd00000</div><div class=3D"gmail_default">[=C2=A0 =C2=
=A0 4.257885] ba00: ffffffffffffffff 0000000000007c9f ffffff800987ba30 ffff=
ff80087061d0</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.257908] [&l=
t;ffffff80087061d0&gt;] dss_drm_init+0x1a8/0x680</div><div class=3D"gmail_d=
efault">[=C2=A0 =C2=A0 4.257926] [&lt;ffffff8008705490&gt;] kirin_drm_bind+=
0x128/0x310</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.257945] [&lt=
;ffffff8008740c88&gt;] try_to_bring_up_master+0x180/0x1e0</div><div class=
=3D"gmail_default">[=C2=A0 =C2=A0 4.257965] [&lt;ffffff8008740d8c&gt;] comp=
onent_add+0xa4/0x170</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.257=
981] [&lt;ffffff800870b574&gt;] dsi_probe+0x52c/0x5a0</div><div class=3D"gm=
ail_default">[=C2=A0 =C2=A0 4.258000] [&lt;ffffff8008749d60&gt;] platform_d=
rv_probe+0x60/0xc0</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.25801=
8] [&lt;ffffff8008747a94&gt;] driver_probe_device+0x234/0x2e0</div><div cla=
ss=3D"gmail_default">[=C2=A0 =C2=A0 4.258037] [&lt;ffffff8008747cb0&gt;] __=
device_attach_driver+0xa0/0xe8</div><div class=3D"gmail_default">[=C2=A0 =
=C2=A0 4.258056] [&lt;ffffff80087459d0&gt;] bus_for_each_drv+0x58/0xa8</div=
><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.258072] [&lt;ffffff80087476e=
8&gt;] __device_attach+0xc8/0x138</div><div class=3D"gmail_default">[=C2=A0=
 =C2=A0 4.302470] [&lt;ffffff8008747d74&gt;] device_initial_probe+0x24/0x30=
</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.302490] [&lt;ffffff8008=
746ae4&gt;] bus_probe_device+0x9c/0xa8</div><div class=3D"gmail_default">[=
=C2=A0 =C2=A0 4.302506] [&lt;ffffff8008746fcc&gt;] deferred_probe_work_func=
+0xac/0x150</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.302528] [&lt=
;ffffff80080efd98&gt;] process_one_work+0x1d8/0x490</div><div class=3D"gmai=
l_default">[=C2=A0 =C2=A0 4.302547] [&lt;ffffff80080f0298&gt;] worker_threa=
d+0x248/0x478</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.302565] [&=
lt;ffffff80080f6728&gt;] kthread+0x138/0x140</div><div class=3D"gmail_defau=
lt">[=C2=A0 =C2=A0 4.302584] [&lt;ffffff8008084d7c&gt;] ret_from_fork+0x10/=
0x1c</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.302601] Code: f9003=
7a4 97e8a1ea f943a69b 9140077b (b940037b)=C2=A0</div><div class=3D"gmail_de=
fault">[=C2=A0 =C2=A0 4.302621] ---[ end trace d64c23a811313502 ]---</div><=
div class=3D"gmail_default">[=C2=A0 =C2=A0 4.302638] Kernel panic - not syn=
cing: Fatal exception</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 4.30=
2656] SMP: stopping secondary CPUs</div><div class=3D"gmail_default">[=C2=
=A0 =C2=A0 4.332694] Kernel Offset: disabled</div><div class=3D"gmail_defau=
lt">[=C2=A0 =C2=A0 4.332708] CPU features: 0x002004</div><div class=3D"gmai=
l_default">[=C2=A0 =C2=A0 4.332720] Memory Limit: none</div><div class=3D"g=
mail_default">[=C2=A0 =C2=A0 4.332736] Rebooting in 5 seconds..</div><div>=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D</div></font></div><div class=3D"gmail_default"><br></div><div class=3D"=
gmail_default"><font color=3D"#0b5394">How to fix this IO addr size fault, =
I think some problem in dts or debian.cfg to map Physical addresses to GFNs=
</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">Please he=
lp me to come out of this problem.</font></div></div></div></div><div class=
=3D"gmail_default"><br></div><div class=3D"gmail_default" style=3D"color:rg=
b(11,83,148)">Thanks</div><div class=3D"gmail_default" style=3D"color:rgb(1=
1,83,148)">Omkar B</div></div></div></div></div></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Thu, Nov 1, 2018 at 1:11 AM Julien Gra=
ll &lt;<a href=3D"mailto:julien.grall@arm.com" target=3D"_blank">julien.gra=
ll@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 10/17/18 1:24 PM, Omkar Bolla wrote:<br>
&gt; Hi,<br>
<br>
Hi Omkar,<br>
<br>
&gt; I have started finding which patch introduced Armv8 Secondary CPUs iss=
ue.<br>
&gt; <br>
&gt; I just want to start PV vdevb before domainU debian rootfs mount. Is i=
t <br>
&gt; possible?<br>
<br>
May I ask why you need the dependency on the rootfs?<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div>

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
--0000000000006a8932057996dbaf--


--===============6198494298375653448==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6198494298375653448==--
