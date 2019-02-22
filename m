From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12] x86: Improve the efficiency of
 domain_relinquish_resources()
Date: Fri, 22 Feb 2019 05:40:41 -0700
Message-ID: <5C6FEDC90200007800219212@prv1-mh.provo.novell.com>
References: <1550751733-3091-1-git-send-email-andrew.cooper3@citrix.com>
 <20190221133111.mckklesaynbr4hxa@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190221133111.mckklesaynbr4hxa@zion.uk.xensource.com>
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
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAyLjE5IGF0IDE0OjMxLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBGZWIgMjEsIDIwMTkgYXQgMTI6MjI6MTNQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPj4gcGNpX3JlbGVhc2VfZGV2aWNlcygpIHRha2VzIHRoZSBnbG9iYWwgUENJIGxvY2su
ICBPbmNlIHBjaV9yZWxlYXNlX2RldmljZXMoKQo+PiBoYXMgY29tcGxldGVkLCBpdCB3aWxsIGJl
IGNhbGxlZCByZWR1bmRhbnRseSBlYWNoIHRpbWUgcGFnaW5nX3RlYXJkb3duKCkgYW5kCj4+IHZj
cHVfZGVzdHJveV9wYWdldGFibGVzKCkgY29udGludWUuCj4+IAo+PiBUaGlzIGlzIGxpYWJsZSB0
byBiZSBtaWxsaW9ucyBvZiB0aW1lcyBmb3IgYSByZWFzb25hYmx5IHNpemVkIGd1ZXN0LCBhbmQg
aXMgYQo+PiBzZXJpYWxpc2luZyBib3R0bGVuZWNrIG5vdyB0aGF0IGRvbWFpbl9raWxsKCkgY2Fu
IGJlIHJ1biBjb25jdXJyZW50bHkgb24KPj4gZGlmZmVyZW50IGRvbWFpbnMuCj4+IAo+PiBJbnN0
ZWFkIG9mIHByb3BhZ2F0aW5nIHRoZSBvcGVuY29kaW5nIG9mIHRoZSByZWxpbnF1aXNoIHN0YXRl
IG1hY2hpbmUsIHRha2UKPj4gdGhlIG9wcG9ydHVuaXR5IHRvIGNsZWFuIGl0IHVwLgo+PiAKPj4g
TGVhdmUgYSBwcm9wZXIgc2V0IG9mIGNvbW1lbnRzIGV4cGxhaW5pbmcgdGhhdCBkb21haW5fcmVs
aW5xdWlzaF9yZXNvdXJjZXMoKQo+PiBpbXBsZW1lbnRzIGEgY28tcm91dGluZS4gIEludHJvZHVj
ZSBhIGRvY3VtZW50ZWQgUFJPR1JFU1MoKSBtYWNybyB0byBhdm9pZAo+PiBsYXRlbnQgYnVncyBz
dWNoIGFzIHRoZSBSRUxNRU1feGVuIGNhc2UsIGFuZCBtYWtlIHRoZSBuZXcgUFJPR18qIHN0YXRl
cwo+PiBwcml2YXRlIHRvIGRvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcygpLgo+PiAKPj4gU2ln
bmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAK
PiBSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
