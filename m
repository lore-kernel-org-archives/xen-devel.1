From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/Xen: streamline (and fix) PV CPU
 enumeration
Date: Wed, 27 Mar 2019 13:07:19 -0400
Message-ID: <2f027b4b-dce2-3e90-dc1b-c824bc8eb355__36419.6892290906$1553706153$gmane$org@oracle.com>
References: <5C9B92EA020000780022227B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ETTt=R6=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1h9Bvj-0001Mm-Fp
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 17:01:35 +0000
In-Reply-To: <5C9B92EA020000780022227B@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMy8yNy8xOSAxMToxMiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gLQo+IC1zdGF0aWMgdm9p
ZCBfX2luaXQgeGVuX2ZpbHRlcl9jcHVfbWFwcyh2b2lkKQo+ICtzdGF0aWMgdm9pZCBfX2luaXQg
X2dldF9zbXBfY29uZmlnKHVuc2lnbmVkIGludCBlYXJseSkKPiAgewo+ICAJaW50IGksIHJjOwo+
ICAJdW5zaWduZWQgaW50IHN1YnRyYWN0ID0gMDsKPiAgCj4gLQlpZiAoIXhlbl9pbml0aWFsX2Rv
bWFpbigpKQo+ICsJaWYgKGVhcmx5KQo+ICAJCXJldHVybjsKPiAgCj4gIAludW1fcHJvY2Vzc29y
cyA9IDA7CgoKSXMgdGhlcmUgYSByZWFzb24gdG8gc2V0X2NwdV9wb3NzaWJsZSgpIGhlcmUgKG5v
dCBpbiB0aGUgZGlmZiwgYnV0IGluCnRoaXMgcm91dGluZSk/IFRoaXMgd2lsbCBiZSBjYWxsZWQg
ZnJvbSBzZXR1cF9hcmNoKCkgYmVmb3JlCnByZWZpbGxfcG9zc2libGVfbWFwKCksIHdoaWNoIHdp
bGwgY2xlYXIgYW5kIHRoZW4gcmUtaW5pdGlhbGl6ZQpfX2NwdV9wb3NzaWJsZV9tYXNrLgoKCgot
Ym9yaXMKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
