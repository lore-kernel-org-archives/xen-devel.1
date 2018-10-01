From: "Andreas Kinzler" <hfp@posteo.de>
Subject: Re: [PATCH] libxl: keep assigned pci devices across
 domain reboots
Date: Mon, 01 Oct 2018 18:25:57 +0200
Message-ID: <op.zp7rxjr7ollboj@kriftel>
References: <20180920104025.88948-1-roger.pau@citrix.com>
 <20180926101925.GD5318@reaktio.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=----------E0olPD4ZbnKXWT22O7t9Ue
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=eo1h=mn=posteo.de=hfp@srs-us1.protection.inumbo.net>)
 id 1g711M-0005jN-3H
 for xen-devel@lists.xenproject.org; Mon, 01 Oct 2018 16:26:08 +0000
Received: from submission (posteo.de [89.146.220.130])
 by mout01.posteo.de (Postfix) with ESMTPS id 3EEA521294
 for <xen-devel@lists.xenproject.org>; Mon,  1 Oct 2018 18:26:03 +0200 (CEST)
In-Reply-To: <20180926101925.GD5318@reaktio.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, =?iso-8859-15?Q?Pasi_K=E4rkk=E4inen?= <pasik@iki.fi>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

------------E0olPD4ZbnKXWT22O7t9Ue
Content-Type: text/plain; charset=iso-8859-15; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

>> Fill the from_xenstore libxl_device_type hook for PCI devices so that
>> libxl_retrieve_domain_configuration can properly retrieve PCI devices
>> from xenstore.
>> This fixes disappearing pci devices across domain reboots.
> This patch seems to be committed now. Please backport this to Xen 4.10  
> stable branch, for upcoming 4.10.3, because original bugreport was about  
> Xen 4.10.

Thanks to devs for the patch. I tested the patch and I can confirm that it  
fixes my original problem on Xen 4.10. To use with Xen 4.10 you need a  
small backport patch (attached).

Regards Andreas
------------E0olPD4ZbnKXWT22O7t9Ue
Content-Disposition: attachment; filename=backport-4.10.patch
Content-Type: application/octet-stream; name="backport-4.10.patch"
Content-Transfer-Encoding: Base64

U2lnbmVkLW9mZi1ieTogQW5kcmVhcyBLaW56bGVyIDxoZnBAcG9zdGVvLmRlPgoK
LS0tIGtlZXAtcGNpcHQtZHVyaW5nLXJlYm9vdC5wYXRjaAlNb24gT2N0IDEgMTY6
MTQ6NDQgMjAxOCBVVEMKKysrIGtlZXAtcGNpcHQtZHVyaW5nLXJlYm9vdC5wYXRj
aAlNb24gT2N0IDEgMTU6MzQ6MTcgMjAxOCBVVEMKQEAgLTI3LDggKzI3LDggQEAK
ICAKICAjZGVmaW5lIGxpYnhsX19kZXZpY2VfcGNpX3VwZGF0ZV9kZXZpZCBOVUxM
CiAgCi0tREVGSU5FX0RFVklDRV9UWVBFX1NUUlVDVF9YKHBjaWRldiwgcGNpLCBQ
Q0kpOwotK0RFRklORV9ERVZJQ0VfVFlQRV9TVFJVQ1RfWChwY2lkZXYsIHBjaSwg
UENJLAorLURFRklORV9ERVZJQ0VfVFlQRV9TVFJVQ1RfWChwY2lkZXYsIHBjaSwg
cGNpKTsKKytERUZJTkVfREVWSUNFX1RZUEVfU1RSVUNUX1gocGNpZGV2LCBwY2ks
IHBjaSwKICsgICAgLmZyb21feGVuc3RvcmUgPSAoZGV2aWNlX2Zyb21feGVuc3Rv
cmVfZm5fdClsaWJ4bF9fZGV2aWNlX3BjaV9mcm9tX3hzX2JlLAogKyk7CiAgCg==

------------E0olPD4ZbnKXWT22O7t9Ue
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

------------E0olPD4ZbnKXWT22O7t9Ue--
