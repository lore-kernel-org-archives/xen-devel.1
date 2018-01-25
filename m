From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v10 09/11] x86/ctxt: Issue a speculation
 barrier between vcpu contexts
Date: Thu, 25 Jan 2018 09:31:33 -0700
Message-ID: <5A6A147502000078001A27A0@prv-mh.provo.novell.com>
References: <1516799535-5778-1-git-send-email-andrew.cooper3@citrix.com>
 <1516799535-5778-10-git-send-email-andrew.cooper3@citrix.com>
 <5A6A0C7A02000078001A275A@prv-mh.provo.novell.com>
 <345bd2ef-1319-d9a6-522c-31e42bcd2c2e@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <345bd2ef-1319-d9a6-522c-31e42bcd2c2e@citrix.com>
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
Cc: Dario Faggioli <dario.faggioli@citrix.com>, David Woodhouse <dwmw@amazon.co.uk>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjAxLjE4IGF0IDE3OjA5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjUvMDEvMTggMTU6NTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyNC4w
MS4xOCBhdCAxNDoxMiwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gQEAg
LTE3NDMsNiArMTc0NCwzNCBAQCB2b2lkIGNvbnRleHRfc3dpdGNoKHN0cnVjdCB2Y3B1ICpwcmV2
LCBzdHJ1Y3QgdmNwdSAqbmV4dCkKPj4+ICAgICAgICAgIH0KPj4+ICAKPj4+ICAgICAgICAgIGN0
eHRfc3dpdGNoX2xldmVsbGluZyhuZXh0KTsKPj4+ICsKPj4+ICsgICAgICAgIGlmICggb3B0X2li
cGIgJiYgIWlzX2lkbGVfZG9tYWluKG5leHRkKSApCj4+IElzIHRoZSBpZGxlIGRvbWFpbiBjaGVj
ayBoZXJlIHJlYWxseSB1c2VmdWw/Cj4gCj4gWWVzLCBiZWNhdXNlIGFzIHlvdSBwb2ludGVkIG91
dCBpbiB2OSwgdGhlIG91dGVyIGNvbmRpdGlvbiBpc24ndAo+IHN1ZmZpY2llbnQgdG8gZXhjbHVk
ZSBuZXh0ZCBiZWluZyBpZGxlLgoKVHJ1ZSwgYnV0IHRoZW4gYWdhaW4gLSB3aGF0J3Mgd3Jvbmcg
d2l0aCBhbiBpZGxlIHZDUFUgbWFraW5nIGl0CmludG8gdGhlIGJsb2NrPyBJdCdsbCBiZSBhIHBv
aW50bGVzcyBiYXJyaWVyIHRoYXQgeW91IGlzc3VlLCBidXQgbm8Kb3RoZXIgaGFybSBhZmFpY3Mu
IFJlbWVtYmVyIHRoYXQgSSBjb21wbGFpbmVkIGFib3V0IHRoZSBtaXNzaW5nCmNoZWNrIG9ubHkg
YmVjYXVzZSBvZiB0aGUgY2hvc2VuIHZhcmlhYmxlIG5hbWluZywgYnV0IHlvdSd2ZQpyZW5hbWVk
IHRoZSB2YXJpYWJsZXMgaW4gcXVlc3Rpb24sIHNvIEkgZG9uJ3Qgc2VlIHdoeSB5b3UndmUgYWxz
bwphZGRlZCB0aGUgZXh0cmEgY29uZGl0aW9uLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
