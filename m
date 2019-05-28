From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH RFC 2] [DO NOT APPLY] introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
Date: Tue, 28 May 2019 12:36:29 +0300
Message-ID: <eec4ac53-eb73-c919-d54c-2b926816c5cb@gmail.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <c31fb2f8-1703-61db-fd7d-f41db6a137d8@arm.com>
 <d94e7186-5f5d-1d93-4462-af18ba7da018@gmail.com>
 <bb5aa1e6-f927-5f96-dbd7-1582da1733f3@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M056=T4=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hVYX4-0007jN-Ee
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 09:36:34 +0000
Received: by mail-lf1-x142.google.com with SMTP id b11so7612635lfa.5
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2019 02:36:33 -0700 (PDT)
In-Reply-To: <bb5aa1e6-f927-5f96-dbd7-1582da1733f3@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyOC4wNS4xOSAxMjoyMywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEluIGdlbmVyYWwsIGFs
bCB0aGUgcGF0Y2ggc2VudCBhcmUgc3RhcnRpbmcgd2l0aCBhIG51bWJlciBmb2xsb3dlZCBieSB0
aGUgdGl0bGUuIFRoZSBudW1iZXIgZW5zdXJlIHRoZSBjb3JyZWN0IG9yZGVyaW5nLiBJZiB5b3Ug
ZG9uJ3QgaGF2ZSBudW1iZXIgdGhlbiwgeW91IHdpbGwgZmFsbGJhY2sgdG8gYWxwaGFiZXRpY2Fs
IG9yZGVyLgpBaCwgeWVzLCBzdXJlLiBJIGRpZCByZW5hbWUgbWFudWFsbHkgUkZDMSBwYXRjaCBm
aWxlLiBCdXQgc29tZXdoeSBtaXNzZWQgcmVuYW1pbmcgUkZDMiBwYXRjaCBmaWxlLgoKLS0gClNp
bmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
