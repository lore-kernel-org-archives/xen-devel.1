From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] docs/xl: Clarify documentation for
 mem-max and mem-set
Date: Mon, 13 May 2019 15:28:22 +0100
Message-ID: <20190513142822.GO2798@zion.uk.xensource.com>
References: <20190408110943.8987-1-george.dunlap@citrix.com>
 <ee29edd9-a23d-eb00-d403-1e8040bf3174@citrix.com>
 <20190513135930.GJ2798@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpFc=TN=citrix.com=prvs=0298122e9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQBwO-0001Al-Dt
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:28:32 +0000
Content-Disposition: inline
In-Reply-To: <20190513135930.GJ2798@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDI6NTk6MzBQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBXZWQsIE1heSAwMSwgMjAxOSBhdCAwMzo1OTo0MVBNICswMTAwLCBHZW9yZ2UgRHVubGFw
IHdyb3RlOgo+ID4gT24gNC84LzE5IDEyOjA5IFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+ID4g
PiBtZW0tc2V0IGlzIHRoZSBwcmltYXJ5IGNvbW1hbmQgdGhhdCB1c2VycyB3aWxsIG5lZWQgdG8g
dXNlIGFuZAo+ID4gPiB1bmRlcnN0YW5kLiAgTW92ZSBpdCBmaXJzdCwgYW5kIGNsYXJpZnkgdGhl
IHdvcmRpbmc7IGFsc28gc3BlY2lmeSB0aGF0Cj4gPiA+IHlvdSBjYW4ndCBzZXQgdGhlIHRhcmdl
dCBoaWdoZXIgdGhhbiBtYXhtZW0gZnJvbSB0aGUgZG9tYWluIGNvbmZpZy4KPiA+ID4gCj4gPiA+
IG1lbS1tYXggaXMgYWN0dWFsbHkgYSBwcmV0dHkgdXNlbGVzcyBjb21tYW5kIGF0IHRoZSBtb21l
bnQuICBDbGFyaWZ5Cj4gPiA+IHRoYXQgdXNlcnMgYXJlIG5vdCBleHBlY3RlZCB0byB1c2UgaXQ7
IGFuZCBkb2N1bWVudCBhbGwgb2YgaXRzIHF1aXJreQo+ID4gPiBiZWhhdmlvci4KPiA+ID4gCj4g
PiA+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNv
bT4KPiA+IAo+ID4gV2VpIC8gSWFuOiBQaW5nPwo+ID4gCj4gPiBKdWVyZ2VuIHJlcGxpZWQgdG8g
bXkgInJldmlldyBub3RlIiBjb21tZW50LCBub3QgdG8gYW55dGhpbmcgYWN0aW9uYWJsZQo+ID4g
aW4gdGhlIHBhdGNoIChvciBjb21taXQgbWVzc2FnZSkgaXRzZWxmLgo+IAo+IEFja2VkLWJ5OiBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IAo+IChJIGFscmVhZHkgc2FpZCB0aGlzIGxv
b2tlZCBva2F5IHRvIG1lIGluIHYxKQoKSSBiZWxpZXZlIExhcnMnIFJiIGZyb20gdjEgc3RpbGwg
c3RhbmRzLgoKSSB3aWxsIGFkZCB3aGlsZSBJIGNvbW1pdCB0aGlzIHBhdGNoLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
