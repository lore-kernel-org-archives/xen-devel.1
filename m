From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9 02/11] x86/cpuid: Handling of IBRS/IBPB,
 STIBP and IBRS for guests
Date: Fri, 19 Jan 2018 08:09:31 -0700
Message-ID: <5A62183B02000078001A06CD@prv-mh.provo.novell.com>
References: <1516290370-14958-1-git-send-email-andrew.cooper3@citrix.com>
 <1516290370-14958-3-git-send-email-andrew.cooper3@citrix.com>
 <5A61D91102000078001A0481@prv-mh.provo.novell.com>
 <86dc061f-afa7-b260-b096-b6efbf464dec@citrix.com>
 <5A61E89202000078001A0556@prv-mh.provo.novell.com>
 <6e6b06da-c6b1-0972-b078-4d351d1ef2c7@citrix.com>
 <5A61EE6B02000078001A0595@prv-mh.provo.novell.com>
 <98317d94-a80c-57be-1919-e40fe834188e@citrix.com>
 <5A61F80202000078001A05D6@prv-mh.provo.novell.com>
 <e88cedd2-a37d-5725-f6c9-fccfa5fdbfc1@citrix.com>
 <5A6201AE02000078001A060C@prv-mh.provo.novell.com>
 <c366f692-fb47-5ac5-227b-00f7e8b6e7f2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <c366f692-fb47-5ac5-227b-00f7e8b6e7f2@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAxLjE4IGF0IDE2OjAwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gSSdtIGFmcmFpZCB0aGF0IGRlc3BpdGUgYWxsIG9mIHRoaXMsIEkgZG9uJ3Qgc2VlIGFu
IHZhbGlkIGFyZ3VtZW50Cj4gYWdhaW5zdCB0aGUgbG9naWMgYXMgaW1wbGVtZW50ZWQgaW4gdGhl
IHBhdGNoLCBhbmQgSSBkb24ndCBzZWUgYW55Cj4gdmlhYmxlIG9wdGlvbiB0byB3b3JraW5nIGFy
b3VuZCB0aGUgZWRnZSBjYXNlIHlvdSBhcmUgY29uY2VybmVkIGFib3V0LAo+IHdoaWNoIGlzIHZl
cnkgZGVmaW5pdGVseSBhIG1pY3JvY29kZSBidWcuCgpXZWxsLCBva2F5LCB0aGVuIGxldCdzIGxl
YXZlIGl0IGF0IHRoYXQgYW5kIGhvcGUgZm9yIHRoZSBiZXN0OgpSZXZpZXdlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
