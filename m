From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 04/10] Make MEM_ACCESS configurable
Date: Fri, 1 Jun 2018 08:24:29 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1806010821580.23991@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1805311447570.23991@sstabellini-ThinkPad-X260>
 <1527803317-31750-4-git-send-email-sstabellini@kernel.org>
 <5B11256802000078001C768E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B11256802000078001C768E@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Tim Deegan <tim@xen.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAxIEp1biAyMDE4LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gT24gMzEuMDUuMTgg
YXQgMjM6NDgsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+IC0tLSBhL3hlbi9j
b21tb24vS2NvbmZpZwo+ID4gKysrIGIveGVuL2NvbW1vbi9LY29uZmlnCj4gPiBAQCAtMjAsOCAr
MjAsMTYgQEAgY29uZmlnIEhBU19ERVZJQ0VfVFJFRQo+ID4gIGNvbmZpZyBIQVNfRVhfVEFCTEUK
PiA+ICAJYm9vbAo+ID4gIAo+ID4gLWNvbmZpZyBIQVNfTUVNX0FDQ0VTUwo+ID4gLQlib29sCj4g
PiArY29uZmlnIE1FTV9BQ0NFU1NfQUxXQVlTX09OCj4gPiArCWRlZl9ib29sIG4KPiAKPiBPbmx5
ICJib29sIiBwbGVhc2UgLSB0aGVyZSBzaG91bGQgYmUgbm8gZGVmYXVsdHMgb3RoZXIgdGhhbiB5
IGZvciBvcHRpb25zIHdpdGhvdXQKPiBwcm9tcHRzLiBPdGhlcndpc2UsIGlmIGxhdGVyIGFuIG9w
dGlvbiBnYWlucyBhIHByb21wdCwgdGhlIHVzZXIgd29uJ3QgYmUKPiBwcmVzZW50ZWQgd2l0aCB0
aGUgb3B0aW9uIHRvIGVuYWJsZSBpdCB3aGVuIHVzaW5nIG9uZSBvZiB0aGUgKm9sZGNvbmZpZyB0
YXJnZXRzCj4gKGR1ZSB0byB0aGUgcHJldmlvdXNseSByZWNvcmRlZCBzZXR0aW5nKS4KCmRvbmUK
Cgo+IFdpdGggdGhhdCByZXBsYWNlZAo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Cj4gYWxzbyBpbiBjYXNlIHlvdSBmb2xsb3cgVGFtYXMnZXMgc3VnZ2VzdGlvbiBh
bmQgc3dpdGNoIC4uLgo+IAo+ID4gK2NvbmZpZyBNRU1fQUNDRVNTCj4gPiArCWRlZl9ib29sIHkK
PiA+ICsJcHJvbXB0ICJNZW1vcnkgQWNjZXNzIGFuZCBWTSBldmVudHMiIGlmICFNRU1fQUNDRVNT
X0FMV0FZU19PTgo+IAo+IC4uLiB0aGUgZGVmYXVsdCBoZXJlIHRvIE1FTV9BQ0NFU1NfQUxXQVlT
X09OIChvciAhQVJNIG9yIFg4NikuCgpJIGNoYW5nZWQgaXQgdG86CgogIGNvbmZpZyBNRU1fQUND
RVNTCiAgICBkZWZfYm9vbCB5IGlmIE1FTV9BQ0NFU1NfQUxXQVlTX09OCiAgICBwcm9tcHQgIk1l
bW9yeSBBY2Nlc3MgYW5kIFZNIGV2ZW50cyIgaWYgIU1FTV9BQ0NFU1NfQUxXQVlTX09OCgoKVGhh
bmsgeW91LCBJJ2xsIGFkZCB5b3VyIGFja2VkLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
