From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: Fix inconsistent callers of panic()
Date: Fri, 31 Aug 2018 09:12:17 +0200
Message-ID: <143997da-04af-6384-3866-b49c403410e9@suse.com>
References: <1535632297-29549-1-git-send-email-andrew.cooper3@citrix.com>
 <5B87FA3102000078001E38B7@prv1-mh.provo.novell.com>
 <e5ad89df-4408-259b-7a34-1c242c3fb931@citrix.com>
 <5B88E15002000078001E3BBD@prv1-mh.provo.novell.com>
 <7e1164f8-68af-a08b-ff54-4d077562a2ce@suse.com>
 <5B88E88102000078001E3BEF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B88E88102000078001E3BEF@prv1-mh.provo.novell.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMzEvMDgvMTggMDk6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDMxLjA4LjE4IGF0
IDA4OjQzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gT24gMzEvMDgvMTggMDg6MzMsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMzAuMDguMTggYXQgMTk6MDgsIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4+PiBPbiAzMC8wOC8xOCAxNTowNywgSmFuIEJldWxp
Y2ggd3JvdGU6Cj4+Pj4+Pj4+IE9uIDMwLjA4LjE4IGF0IDE0OjMxLCA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4+PiBUaGUgb2JzZXJ2YW50IGFtb25nc3QgeW91IG1pZ2h0
IHJlYWxpc2UgdGhhdCB0aGlzIHJldmVydHMgcGFydHMgb2YgYy9zCj4+Pj4+PiA1MWFkOTBhZWEy
MWMgLSBXaGF0IGNhbiBJIHNheT8gIFNldmVyYWwgeWVhcnMgb2YgaGluZHNpZ2h0IGlzIHZlcnkg
dXNlZnVsLCBhbmQKPj4+Pj4+IGF0IHRoZSB0aW1lIEkgZGlkIGFzayB0aGUgbWFpbnRhaW5lcnMg
d2hpY2ggb3B0aW9uIHRoZXkgdGhvdWdodCB3b3VsZCBiZQo+Pj4+Pj4gYmV0dGVyLi4uCj4+Pj4+
IC4uLiBJIHRoaW5rIGJvdGggdGhlIGVhcmxpZXIgYW5kIHRoaXMgY2hhbmdlIGFyZSBoZWFkaW5n
IGluIHRoZQo+Pj4+PiB3cm9uZyBkaXJlY3Rpb246IEkgd291bGQgbXVjaCByYXRoZXIgc2VlIHRo
ZSBuZXdsaW5lIG9taXR0ZWQKPj4+Pj4gZXZlcnl3aGVyZSwgX2luY2x1ZGluZ18gaW4gcGFuaWMo
KSBpdHNlbGY6IFRoaXMgY2F1c2VzIG9uZSBsaW5lCj4+Pj4+IGxlc3MgdG8gc2Nyb2xsIG9mZiB0
aGUgc2NyZWVuIGluIGNhc2UgeW91IGRvbid0IGhhdmUgYSBzZXJpYWwKPj4+Pj4gY29uc29sZS4K
Pj4KPj4gQ2FuJ3Qgd2UganVzdCBkcm9wIHByaW50aW5nIHRoZSBleHRyYSBcbiBpbiBwYW5pYygp
Pwo+Pgo+PiAtICAgIHByaW50aygiJXNcbiIsIGJ1Zik7Cj4+ICsgICAgcHJpbnRrKCIlcyIsIGJ1
Zik7Cj4gCj4gVGhhdCdzIHdoYXQgSSdtIHN1Z2dlc3RpbmcsIHllcywgcGx1cyAoaWYgdGhlcmUg
YXJlIGFueSkgZHJvcHBpbmcKPiB0cmFpbGluZyBuZXdsaW5lcyBpbiBwYW5pYygpIGludm9jYXRp
b25zLgoKVXVoLCBib3RoPwoKVGhpcyB3b3VsZCBsb29rIGxpa2U6CgoqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKgpQQU5JQyBvbiBjcHUgMjoKYmxhbGJsYWJsYSoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioKCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
