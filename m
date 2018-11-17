From: Amit Tomer <amittomer25@gmail.com>
Subject: Re: [RFC PATCH 1/2] xen/arm: Add Amlogic S905 SoC early
 printk support
Date: Sat, 17 Nov 2018 14:17:44 +0530
Message-ID: <CABHD4K8mPieU9-tFY3e8Gg1_-kdHN82aj2GLg448BGZyhA6-ew@mail.gmail.com>
References: <1533661673-14607-1-git-send-email-amittomer25@gmail.com>
 <1533661673-14607-2-git-send-email-amittomer25@gmail.com>
 <a8821f12-fc38-a69a-9ab5-effa2423246f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8fvs=n4=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1gNwGl-0005nQ-25
 for xen-devel@lists.xenproject.org; Sat, 17 Nov 2018 08:47:59 +0000
Received: by mail-ot1-x342.google.com with SMTP id u3so18428571ota.5
 for <xen-devel@lists.xenproject.org>; Sat, 17 Nov 2018 00:47:58 -0800 (PST)
In-Reply-To: <a8821f12-fc38-a69a-9ab5-effa2423246f@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, wei.liu2@citrix.com, konrad.wilk@oracle.com, George Dunlap <George.Dunlap@eu.citrix.com>, tim@xen.org, ian.jackson@eu.citrix.com, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpUaGFua3MgZm9yIGhhdmluZyBhIGRldGFpbGVkIGxvb2sgYXQgaXQuCgo+ID4gKyNkZWZp
bmUgVUFSVF9TVEFUVVNfUkVHICAgICAweDBjCj4gPiArI2RlZmluZSBVQVJUX1RYX1JFRyAgICAg
ICAgIDB4MDAKPj4gV2h5IGxkcmg/IFRoaXMgaXMgYSAzMi1iaXQgcmVnaXN0ZXIsIGFjdHVhbGx5
IHlvdSBjYW4ndCBiZSBzdXJlIHRoYXQgdGhlCj4gZGV2aWNlIHN1cHBvcnRzIGEgMTYtYml0IGFj
Y2Vzcy4gQmVzaWRlczogdGhlIGJpdCB5b3UgYXJlIGFmdGVyIGlzIGluCj4gdGhlIHVwcGVyIGhh
bGYsIHNvIHlvdSBhY3R1YWxseSB3aWxsIG5ldmVyIHNlZSB0aGUgYml0IHNldC4gSSB3b25kZXIg
aWYKPiB5b3UgYXJlIGxvb3NpbmcgY2hhcmFjdGVycyBoZXJlLgoKTGV0IG1lIGNvbmZlc3Mgd2l0
aCBsZHJoLCBJIGRvIHNlZSBvdXRwdXQgc2NhdHRlcmVkIGFsbCBvdmVyIHRoZSBzY3JlZW4gYW5k
CnJlYWxseSB3b25kZXJpbmcgd2h5IHRoZSBoZWxsIEkgZGlkbid0IG5vdGljZSBpdCB3aGVuIEkg
c2VudCB0aGlzIFJGQy4KClZlcnkgc29ycnkgYWJvdXQgdGhhdC4KCj4gPiArLm1hY3JvIGVhcmx5
X3VhcnRfdHJhbnNtaXQgeGIgd3QKPiA+ICsgICAgIHN0cmIgIFx3dCwgW1x4YiwgI1VBUlRfVFhf
UkVHXQo+Cj4gVFhfV0ZJRk8gaXMgYSAzMi1iaXQgcmVnaXN0ZXIsIHNvIHlvdSBzaG91bGQgcmF0
aGVyIHVzZSBhIDMyLWJpdAo+IGFjY2Vzc29yLgoKT2suSSBndWVzcyAic3RyIiB3b3VsZCBiZSBP
SyB0byB1c2UgPwoKVGhhbmtzCi1BbWl0LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
