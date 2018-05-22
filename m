From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 05/10] arm: make it possible to
 enable/disable UART drivers
Date: Tue, 22 May 2018 03:37:31 -0600
Message-ID: <5B03E4DB02000078001C488F@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1805211743440.4520@sstabellini-ThinkPad-X260>
 <1526950408-18219-5-git-send-email-sstabellini@kernel.org>
 <5B03B9E5020000780013088E@prv1-mh.provo.novell.com>
 <1e655140-2a62-145c-6bcd-7e09676eea9b@arm.com>
 <5B03E15602000078001C484D@prv1-mh.provo.novell.com>
 <558552aa-02f5-ec9a-e68a-4ed20c540f08@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <558552aa-02f5-ec9a-e68a-4ed20c540f08@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjA1LjE4IGF0IDExOjI1LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDA1LzIyLzIwMTggMTA6MjIgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyMi4w
NS4xOCBhdCAxMDo1MSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IE9uIDA1LzIy
LzIwMTggMDc6MzQgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gMDUvMjIvMTggMjo1MyBBTSA+Pj4KPj4+Pj4g
QEAgLTUzLDcgKzUzLDggQEAgY29uZmlnIEhBU19TQ0lGCj4+Pj4+IG9yIFJlbmVzYXMgUi1DYXIg
R2VuIDIvMyBiYXNlZCBib2FyZCBzYXkgWS4KPj4+PiAgICA+Cj4+Pj4+IGNvbmZpZyBIQVNfRUhD
SQo+Pj4+PiAtCWJvb2wKPj4+Pj4gKwlib29sICJFSENJIFVBUlQgZHJpdmVyIgo+Pj4+Cj4+Pj4g
Li4uIGhlcmUgaWlyYyBKdWxpZW4gaGFkIGFscmVhZHkgcG9pbnRlZCBvdXQgdGhhdCB0aGUgZHJp
dmVycyBzaG91bGQgbm90IGJlY29tZQo+Pj4+IG9wdGlvbmFsIG9uIHg4NiwgaS5lLiBpbiB0aGUg
Zm9ybWVyIGNhc2UgeW91IHdhbnQgdG8gYXR0YWNoIGEgY29uZGl0aW9uYWwgdG8gdGhlCj4+Pj4g
cHJvbXB0IHdoaWxlIGluIHRoZSBsYXR0ZXIgY2FzZSBJIGRvbid0IHNlZSB3aHkgeW91IGFkZCB0
aGUgcHJvbXB0IGluIHRoZSBmaXJzdAo+Pj4+IHBsYWNlIGlmIHlvdSBtZWFuIHRvIG1ha2UgaXQg
eDg2LXNwZWNpZmljLiBXaGljaCBieSBpdHNlbGYgaXMgcXVlc3Rpb25hYmxlCj4+Pj4gdGhvdWdo
OiBXaHkgd291bGQgdGhpcyBkcml2ZXIgYmUgeDg2LXNwZWNpZmljLCB3aGVuIHNvIGZhciBpdCAo
Y29uc2Npb3VzbHkpCj4+Pj4gaGFzbid0IGJlZW4/IElmIGFueXRoaW5nIEkgY291bGQgc2VlIGl0
IGRlcGVuZCBvbiBIQVNfUENJLgo+Pj4KPj4+IEkgZG9uJ3QgZXhwZWN0IHRoaXMgcGllY2Ugb2Yg
aGFyZHdhcmUgdG8gY29tZSB1cCBvbiBBcm0uCj4+IAo+PiBJIGNhbiByZWFkIHR3byBtZWFuaW5n
cyBpbnRvIHRoaXM6IFlvdSBleHBlY3QgdGhlIGRyaXZlciB0byBub3Qgd29yayBvbgo+PiBBUk0s
IG9yIHlvdSdyZSBjb25maWRlbnQgdGhlIEVIQ0kgcHJvdG9jb2wgb2YgYWNjZXNzaW5nIFVTQiBo
b3N0Cj4+IGNvbnRyb2xsZXIgaGFyZHdhcmUgbm90IHVzZWQgYW55d2hlcmUgaW4gZGV2aWNlcyB1
c2VkIG9uIEFSTS4gV2hpY2gKPj4gb2YgdGhlIHR3byB5b3UgbWVhbiBkZXRlcm1pbmVzIHdoYXQg
dGhlIGNvcnJlY3QgYXBwcm9hY2ggaGVyZSBpcy4KPiAKPiBJIGFtIHF1aXRlIGNvbmZpZGVudCB0
aGUgRUhDSSBwcm90b2NvbCBpcyBub3QgdXNlZCBvbiBBcm0uCgpBbmQgd2h5IHdvdWxkIHRoYXQg
YmU/IEkgdGhvdWdodCBQQ0kgd2FzIHVuaXZlcnNhbCBlbm91Z2ggdGhhdCBJIGNvdWxkCnB1dCBi
YXNpY2FsbHkgYW55IGNhcmQgaW50byBhIHN5c3RlbSBpbmRlcGVuZGVudCBvZiBDUFUgYXJjaGl0
ZWN0dXJlLApwZXJoYXBzIHdpdGggdGhlIGV4Y2VwdGlvbiBvZiBzdWNoIHJlcXVpcmluZyBvcHRp
b24gUk9NcyBidXQgbm90IG9mZmVyaW5nCmFuIEVGSSBCeXRlIENvZGUgZmxhdm9yIG9mIHRoYXQg
Y29kZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
