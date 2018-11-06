From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 5/6] x86/emul: Don't use the ->cpuid() hook
 for feature checks
Date: Tue, 06 Nov 2018 08:32:30 -0700
Message-ID: <5BE1B40E02000078001F8BA6@prv1-mh.provo.novell.com>
References: <1541416867-30253-1-git-send-email-andrew.cooper3@citrix.com>
 <1541416867-30253-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1541416867-30253-6-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjExLjE4IGF0IDEyOjIxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gRm9yIGEgcmVsZWFzZSBidWlsZCBvZiB4ZW4sIHRoaXMgcmVtb3ZlcyBhbG1vc3QgNGsg
b2YgY29kZSB2b2x1bWUsIGFuZCByZW1vdmVzCj4gYSBmdW5jdGlvbiBwb2ludGVyIGNhbGwgZnJv
bSBldmVyeSBpbnN0YW50aWF0aW9uLgo+IAo+ICAgYWRkL3JlbW92ZTogMC8xIGdyb3cvc2hyaW5r
OiAwLzMgdXAvZG93bjogMC8tMzg3NyAoLTM4NzcpCj4gICBGdW5jdGlvbiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBvbGQgICAgIG5ldyAgIGRlbHRhCj4gICBhZGp1c3RfYm5k
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAyMjcgICAgIDIwNSAgICAgLTIyCj4g
ICB4ODZfZGVjb2RlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDgxMzYgICAgODA5
NiAgICAgLTQwCj4gICB2Y3B1X2hhcy5pc3JhICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAxMzMgICAgICAgLSAgICAtMTMzCj4gICB4ODZfZW11bGF0ZSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAxMTg2ODcgIDExNTAwNSAgIC0zNjgyCj4gICBUb3RhbDogQmVmb3JlPTMzMDky
MDAsIEFmdGVyPTMzMDUzMjMsIGNoZyAtMC4xMiUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
