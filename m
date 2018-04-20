From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] shim: don't let build modify shim.config
Date: Fri, 20 Apr 2018 11:47:33 +0200
Message-ID: <7baa5487-cee0-10f4-1227-e9a7cd7225c3@suse.com>
References: <20180419103024.14731-1-jgross@suse.com>
 <5AD873C502000078001BCA14@suse.com>
 <be2a5e99-6695-aa53-7690-0d19b2b76a09@suse.com>
 <20180419145453.ahbpxclr5isbhdcm@citrix.com>
 <d0111f15-f50a-3d58-b210-520c4fe85a90@citrix.com>
 <20180419162227.vo7cgh6tqe5npu3w@citrix.com>
 <20180420092832.7uwpwgiaq4ak7inh@MacBook-Pro-de-Roger.local>
 <aed28c38-1ca3-6253-3f3a-86ab93e1477d@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------A45D5DF3FCE420E2EE1F4AD4"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=7tp6=hj=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f9Sdo-000829-1u
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 09:47:40 +0000
In-Reply-To: <aed28c38-1ca3-6253-3f3a-86ab93e1477d@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--------------A45D5DF3FCE420E2EE1F4AD4
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 20/04/18 11:33, Andrew Cooper wrote:
> On 20/04/18 10:28, Roger Pau Monné wrote:
>> On Thu, Apr 19, 2018 at 05:22:28PM +0100, Wei Liu wrote:
>>> On Thu, Apr 19, 2018 at 05:14:38PM +0100, Andrew Cooper wrote:
>>>> On 19/04/18 15:54, Wei Liu wrote:
>>>>> On Thu, Apr 19, 2018 at 01:01:53PM +0200, Juergen Gross wrote:
>>>>>> On 19/04/18 12:47, Jan Beulich wrote:
>>>>>>>>>> On 19.04.18 at 12:30, <jgross@suse.com> wrote:
>>>>>>>> --- a/tools/firmware/xen-dir/Makefile
>>>>>>>> +++ b/tools/firmware/xen-dir/Makefile
>>>>>>>> @@ -41,21 +41,22 @@ linkfarm.stamp: $(DEP_DIRS) $(DEP_FILES) FORCE
>>>>>>>>  $(D): linkfarm.stamp
>>>>>>>>  	$(MAKE) -C $(D)/xen distclean
>>>>>>>>  
>>>>>>>> -.PHONY: shim-%config
>>>>>>>> -shim-%config: $(D) FORCE
>>>>>>>> -	$(MAKE) -C $(D)/xen $*config \
>>>>>>> I think there was a reason for the % and $*.
>>>>>> The only one I could think of is the possibility to do
>>>>>>
>>>>>> make shim-defaultconfig
>>>>>>
>>>>>> or similar calls. Question is who will ever need that. In case it is
>>>>>> believed to be valuable I can keep it.
>>>>> Not likely I think.
>>>> Using `make shim-menuconfig` was a specific usecase for my original
>>>> version, but with this difference in representation, the usecase has
>>>> mostly gone away.
>>>>
>>>> With this change in place, what is the expected workflow for making an
>>>> update to the configuration?
>>>>
>>> Just commit the must-have's to the tracked file and let Xen's build
>>> system handle the rest?
>> +1. As a bare minimum:
>>
>> CONFIG_XEN_GUEST=y
>> CONFIG_PVH_GUEST=y
>> CONFIG_PV_SHIM=y
>> CONFIG_PV_SHIM_EXCLUSIVE=y
>>
>> But I expect some more might be needed.
> 
> CONFIG_SHADOW_PAGING=n
> CONFIG_NR_CPUS=32
> CONFIG_VIDEO=n
> CONFIG_HVM_FEP=n
> CONFIG_TBOOT=n
> CONFIG_KEXEC=n
> CONFIG_TMEM=n
> CONFIG_XENOPROF=n
> 
> Remember that shim also wants to be as much of a slimline build as possible

Attached is the minimal shim.config to be fed into "make olddefconfig"
resulting in the current config used for the shim.


Juergen

--------------A45D5DF3FCE420E2EE1F4AD4
Content-Type: application/x-config;
 name="shim.config"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="shim.config"

Q09ORklHX05SX0NQVVM9MzIKIyBDT05GSUdfU0hBRE9XX1BBR0lORyBpcyBub3Qgc2V0CiMg
Q09ORklHX1RCT09UIGlzIG5vdCBzZXQKQ09ORklHX1hFTl9HVUVTVD15CkNPTkZJR19QVkhf
R1VFU1Q9eQpDT05GSUdfUFZfU0hJTT15CkNPTkZJR19QVl9TSElNX0VYQ0xVU0lWRT15CiMg
Q09ORklHX0tFWEVDIGlzIG5vdCBzZXQKIyBDT05GSUdfVE1FTSBpcyBub3Qgc2V0CiMgQ09O
RklHX1hFTk9QUk9GIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NIRURfQ1JFRElUMiBpcyBub3Qg
c2V0CiMgQ09ORklHX1NDSEVEX1JURFMgaXMgbm90IHNldAojIENPTkZJR19TQ0hFRF9BUklO
QzY1MyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDSEVEX05VTEwgaXMgbm90IHNldAojIENPTkZJ
R19MSVZFUEFUQ0ggaXMgbm90IHNldAojIENPTkZJR19TVVBQUkVTU19EVVBMSUNBVEVfU1lN
Qk9MX1dBUk5JTkdTIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUcgaXMgbm90IHNldAo=
--------------A45D5DF3FCE420E2EE1F4AD4
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------A45D5DF3FCE420E2EE1F4AD4--
