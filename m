From: Hans-Joachim Kliemeck <info@kliemeck.de>
Subject: Re: PVH backports to 4.9 and 4.8
Date: Wed, 28 Feb 2018 19:38:32 +0100
Message-ID: <5f747731-2182-e485-7843-b35f2db13b23@kliemeck.de>
References: <97dc0694-d27f-2e50-afd3-a4f7fc828f1d@kliemeck.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6022059766711830251=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=hi5t=fw=kliemeck.de=info@srs-us1.protection.inumbo.net>)
 id 1er6cg-00032q-80
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 18:38:38 +0000
In-Reply-To: <97dc0694-d27f-2e50-afd3-a4f7fc828f1d@kliemeck.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--===============6022059766711830251==
Content-Type: multipart/alternative;
 boundary="------------10C50909858AA1C82D126020"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------10C50909858AA1C82D126020
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


> George Dunlap:
>> /On 01/23/2018 04:06 AM, Simon Gaiser wrote:/
>> /> George Dunlap:/
>> />> Part of our solution to XSA-254 SP3 (aka "Meltdown") is to backport/
>> />> the PVH mode from 4.10 to 4.9 and 4.8. This will first allow people/
>> />> able to run PVH kernels to switch their PV guests directly to PVH/
>> />> guests; and second, eventually enable the backport of patches which/
>> />> will enable transparent changing of PV guests into PVH guests./
>> />>/
>> />> All of the hypervisor support seems to have existed already in 4.8, so/
>> />> the only backports involve toolstack patches./
>> />>/
>> />> I've put up two trees for a first-cut backport of the PVH/
>> />> functionality, to 4.9 and 4.8 here:/
>> />>/
>> />> git://xenbits.xen.org/people/gdunlap/xen.git/
>> />>/
>> />> Branches out/pvh-backport/4.8/v1 and out/pvh-backport/4.9/v1/
>> />>/
>> />> Below are the patches backported from 4.10 to 4.9 (23 patches total):/
>> /> [...]/
>> />/
>> /> So future 4.8 releases will include the backports, right? Asking because/
>> /> the AFAICS the 4.8.3-pre-shim-comet branch include them but staging-4.8/
>> /> does not./
>> //
>> /Some of us have had informal conversations about backporting PVH and/
>> /Comet host/toolstack patches to 4.8, and a number of us think it's a/
>> /good idea, but we haven't had an official discussion with all the/
>> /stakeholders yet. We'll come back to it once more of the fires have/
>> /been put out./
>> //
>> /Feel free to remind us in a month or so if you still haven't seen any/
>> /patches in the stable-4.8 branch. :-)/
> Ok, thank you for the quick reply. In Qubes we are using PVH with 4.8
> using the old device_model_version=none config option. And changing this
> would be much easier before release (So the change should be in our rc
> now). Anyway if it's not decided yet, we will have to guess what ends up
> in future 4.8.z releases.
>
>

Hi,

is there an update for the backports for 4.8 and 4.9? Or is there some
documentation available to see which parts are missing on 4.9 vs 4.10
(or 4.8 vs 4.10) to get PVH running (device_model_version=none, ...)?

Best Regards
Hajo

--------------10C50909858AA1C82D126020
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <blockquote type="cite"
      cite="mid:97dc0694-d27f-2e50-afd3-a4f7fc828f1d@kliemeck.de">
      <pre wrap="">George Dunlap:
</pre>
      <blockquote type="cite">
        <pre wrap="">/On 01/23/2018 04:06 AM, Simon Gaiser wrote:/
/&gt; George Dunlap:/
/&gt;&gt; Part of our solution to XSA-254 SP3 (aka "Meltdown") is to backport/
/&gt;&gt; the PVH mode from 4.10 to 4.9 and 4.8. This will first allow people/
/&gt;&gt; able to run PVH kernels to switch their PV guests directly to PVH/
/&gt;&gt; guests; and second, eventually enable the backport of patches which/
/&gt;&gt; will enable transparent changing of PV guests into PVH guests./
/&gt;&gt;/
/&gt;&gt; All of the hypervisor support seems to have existed already in 4.8, so/
/&gt;&gt; the only backports involve toolstack patches./
/&gt;&gt;/
/&gt;&gt; I've put up two trees for a first-cut backport of the PVH/
/&gt;&gt; functionality, to 4.9 and 4.8 here:/
/&gt;&gt;/
/&gt;&gt; git://xenbits.xen.org/people/gdunlap/xen.git/
/&gt;&gt;/
/&gt;&gt; Branches out/pvh-backport/4.8/v1 and out/pvh-backport/4.9/v1/
/&gt;&gt;/
/&gt;&gt; Below are the patches backported from 4.10 to 4.9 (23 patches total):/
/&gt; [...]/
/&gt;/
/&gt; So future 4.8 releases will include the backports, right? Asking because/
/&gt; the AFAICS the 4.8.3-pre-shim-comet branch include them but staging-4.8/
/&gt; does not./
//
/Some of us have had informal conversations about backporting PVH and/
/Comet host/toolstack patches to 4.8, and a number of us think it's a/
/good idea, but we haven't had an official discussion with all the/
/stakeholders yet. We'll come back to it once more of the fires have/
/been put out./
//
/Feel free to remind us in a month or so if you still haven't seen any/
/patches in the stable-4.8 branch. :-)/
</pre>
      </blockquote>
      <pre wrap="">
Ok, thank you for the quick reply. In Qubes we are using PVH with 4.8
using the old device_model_version=none config option. And changing this
would be much easier before release (So the change should be in our rc
now). Anyway if it's not decided yet, we will have to guess what ends up
in future 4.8.z releases.


</pre>
    </blockquote>
    <br>
    Hi,<br>
    <br>
    is there an update for the backports for 4.8 and 4.9? Or is there
    some documentation available to see which parts are missing on 4.9
    vs 4.10 (or 4.8 vs 4.10) to get PVH running
    (device_model_version=none, ...)?<br>
    <br>
    Best Regards<br>
    Hajo
  </body>
</html>

--------------10C50909858AA1C82D126020--


--===============6022059766711830251==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6022059766711830251==--
