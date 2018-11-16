From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH 0/4] x86: Drop PVRDTSCP and fix MSR_TSC_AUX
 handling for guests
Date: Fri, 16 Nov 2018 14:55:27 -0500
Message-ID: <20181116195527.GM30052@char.us.oracle.com>
References: <1542318438-20319-1-git-send-email-andrew.cooper3@citrix.com>
 <5BEE97C402000078001FCB10@prv1-mh.provo.novell.com>
 <78463755-55b3-7914-227e-9351702b6764@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <78463755-55b3-7914-227e-9351702b6764@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <JBeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMTYsIDIwMTggYXQgMDU6NDM6NDJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNi8xMS8yMDE4IDEwOjExLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4+IE9u
IDE1LjExLjE4IGF0IDIyOjQ3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
Pj4gQm9yaXMgaGFzIGNvbmZpcm1lZCB0aGF0IG5vb25lIGFwcGVhcnMgdG8gYmUgdXNpbmcgUFZS
RFRTQ1AgYW55IG1vcmUsIGFuZCBpbgo+ID4+IHRoZSBkZWNhZGUgc2luY2UgaXQgd2FzIGludHJv
ZHVjZWQsIGd1ZXN0IGtlcm5lbCAvIGhhcmR3YXJlIHN1cHBvcnQgaGFzCj4gPj4gcHJvdmlkZWQg
YSBiZXR0ZXIgYWx0ZXJuYXRpdmUuCj4gPiBEb2Vzbid0IHJlbW92YWwgb2YgZnVuY3Rpb25hbGl0
eSByZXF1aXJlIGtub3dpbmcgdGhhdCBpdCB3YXMgbmV2ZXIgdXNlZAo+ID4gYXQgYWxsLCByYXRo
ZXIgdGhhbiBqdXN0IGtub3dpbmcgdGhhdCBub3RoaW5nIHVzZXMgaXQgYW55bW9yZT8gV2hhdCBp
Zgo+ID4gc29tZSBvbGQgZ3Vlc3Qgc29tZXdoZXJlIHJlbGllcyBvbiBpdD8KCldlIGhhdmUgdmVy
aWZpZWQgdGhhdCBpdCB3YXMgbmV2ZXIgdXNlZC4KPiAKPiBJdHMgYW4gYWxsLW9yLW5vdGhpbmcg
ZmVhdHVyZS7CoCBUaGUgZW50aXJldHkgb2YgeW91ciBWTSB1c2Vyc3BhY2UgbmVlZAo+IHRvIHN1
cHBvcnQgaXQsIG9yIHRpbWluZyB3aWxsIGdvIHdyb25nIG9uIG1pZ3JhdGUuCj4gCj4gV2UgYWxy
ZWFkeSBlc3RhYmxpc2hlZCB0aGF0IGl0IGFwcGVhcnMgdG8gYmUgYSB2ZXN0aWdpYWwgT3JhY2xl
LWlzbSBmb3IKPiB3aGljaCBubyBjb25zdW1lciBzaWRlIGNvZGUgZXZlciBhcHBlYXJlZCwgYW5k
IHRoYXQgaXNuJ3QgdXNlZC4KPiAKPiBXaGF0IGlzIHVuYWNjZXB0YWJsZSBpcyBQVlJEVFNDUCdz
IGltcGxlbWVudGF0aW9uIGNhdXNpbmcgYnJlYWthZ2VzIGluCj4gYXJjaGl0ZWN0dXJhbCBiZWhh
dmlvdXIgZm9yIG5vbi1QVlJEVFNDUCBjb25maWd1cmF0aW9ucywgYW5kIG9uZSB3YXkgb3IKPiBh
bm90aGVyLCB0aGlzIG5lZWRzIGZpeGluZy4KPiAKPiBQbGVhc2UgY2FuIHdlIG1ha2UgYSBkZWNp
c2lvbiwgYmVjYXVzZSBJIGRvbid0IGhhdmUgdG8gdGltZSAob3IgaW5kZWVkLAo+IHRoZSB3YW50
KSB0byBhbmQgZml4IHRoaXMgYSAzcmQgZGlmZmVyZW50IHdheSBpZiB0aGF0J3MgZ29pbmcgdG8g
cnVuCj4gaW50byBhIHNpbWlsYXIgcmVhY3Rpb24uCj4gCj4gfkFuZHJldwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
