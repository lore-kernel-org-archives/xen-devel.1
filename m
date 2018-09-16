From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 1/6] xenbus: prepare data structures and
 parameter for xenwatch multithreading
Date: Sun, 16 Sep 2018 16:17:35 -0400
Message-ID: <04d7dee9-3011-512a-09b0-0e8dcbdd99d6__2048.08374769545$1537128999$gmane$org@oracle.com>
References: <1536910456-13337-1-git-send-email-dongli.zhang@oracle.com>
 <1536910456-13337-2-git-send-email-dongli.zhang@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j8zy=l6=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1g1dUH-0003ZQ-8b
 for xen-devel@lists.xenproject.org; Sun, 16 Sep 2018 20:17:45 +0000
In-Reply-To: <1536910456-13337-2-git-send-email-dongli.zhang@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongli Zhang <dongli.zhang@oracle.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: jgross@suse.com, wei.liu2@citrix.com, konrad.wilk@oracle.com, srinivas.eeda@oracle.com, paul.durrant@citrix.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiA5LzE0LzE4IDM6MzQgQU0sIERvbmdsaSBaaGFuZyB3cm90ZToKCj4gKwo+ICtzdHJ1Y3Qg
bXR3YXRjaF9pbmZvIHsKPiArCS8qCj4gKwkgKiBUaGUgbXR3YXRjaF9kb21haW4gaXMgcHV0IG9u
IGJvdGggYSBoYXNoIHRhYmxlIGFuZCBhIGxpc3QuCj4gKwkgKiBkb21haW5fbGlzdCBpcyB1c2Vk
IHRvIG9wdGltaXplIHhlbmJ1c193YXRjaCB1bi1yZWdpc3RyYXRpb24uCj4gKwkgKgo+ICsJICog
VGhlIG10d2F0Y2hfZG9tYWluIGlzIHJlbW92ZWQgZnJvbSBkb21haW5faGFzaCAod2l0aCBzdGF0
ZSBzZXQKPiArCSAqIHRvIE1UV0FUQ0hfRE9NQUlOX0RPV04pIHdoZW4gaXRzIHJlZmNudCBpcyB6
ZXJvLiBIb3dldmVyLCBpdCBpcwo+ICsJICogbGVmdCBvbiBkb21haW5fbGlzdCB1bnRpbCBhbGwg
ZXZlbnRzIGJlbG9uZyB0byBzdWNoCj4gKwkgKiBtdHdhdGNoX2RvbWFpbiBhcmUgcHJvY2Vzc2Vk
IGluIG10d2F0Y2hfdGhyZWFkKCkuCgoKRG8gd2UgcmVhbGx5IG5lZWQgdG8ga2VlcCBtd2F0Y2hf
ZG9tYWluIG9uIGJvdGggbGlzdHM/IFdoeSBpcyBrZWVwaW5nIGl0IApvbiwgc2F5LCBvbmx5IHRo
ZSBoYXNoIG5vdCBzdWZmaWNpZW50PwoKPiArCSAqCj4gKwkgKiBXaGlsZSB0aGVyZSBtYXkgZXhp
c3QgdHdvIG10d2F0Y2hfZG9tYWluIHdpdGggdGhlIHNhbWUgZG9taWQgb24KPiArCSAqIGRvbWFp
bl9saXN0IHNpbXVsdGFuZW91c2x5LAoKCkhvdyBpcyBpdCBwb3NzaWJsZSB0byBoYXZlIHR3byBk
b21pZHMgb24gdGhlIGxpc3QgYXQgdGhlIHNhbWUgdGltZT8gCkRvbid0IHlvdSB3YW50IHRvIHJl
bW92ZSBpdCAod2hpY2ggSUlVSUMgbWVhbnMgbW92aW5nIGl0IHRvIHRoZSBwdXJnZSAKbGlzdCkg
d2hlbiBkb21haW4gaXMgZGVzdHJveWVkPwoKCi1ib3JpcwoKCj4gKyAgICAgICogIGFsbCBtdHdh
dGNoX2RvbWFpbiBvbiBoYXNoX2hhc2gKPiArCSAqIHNob3VsZCBoYXZlIHVuaXF1ZSBkb21pZC4K
PiArCSAqLwo+ICsJc3BpbmxvY2tfdCBkb21haW5fbG9jazsKPiArCXN0cnVjdCBobGlzdF9oZWFk
IGRvbWFpbl9oYXNoW01UV0FUQ0hfSEFTSF9TSVpFXTsKPiArCXN0cnVjdCBsaXN0X2hlYWQgZG9t
YWluX2xpc3Q7Cj4gKwo+ICsJLyoKPiArCSAqIFdoZW4gYSBwZXItZG9tVSBrdGhyZWFkIGlzIGdv
aW5nIHRvIGJlIGRlc3Ryb3llZCwgaXQgaXMgcHV0Cj4gKwkgKiBvbiB0aGUgcHVyZ2VfbGlzdCwg
YW5kIHdpbGwgYmUgZmx1c2hlZCBieSBwdXJnZV93b3JrIGxhdGVyLgo+ICsJICovCj4gKwlzdHJ1
Y3Qgd29ya19zdHJ1Y3QgcHVyZ2Vfd29yazsKPiArCXNwaW5sb2NrX3QgcHVyZ2VfbG9jazsKPiAr
CXN0cnVjdCBsaXN0X2hlYWQgcHVyZ2VfbGlzdDsKPiArfTsKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
