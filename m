From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/5] xen/domain: Introduce a new
 check_domain_config() helper
Date: Mon, 08 Oct 2018 07:37:50 -0600
Message-ID: <5BBB5DAE02000078001EF9A7@prv1-mh.provo.novell.com>
References: <1538751289-1109-1-git-send-email-andrew.cooper3@citrix.com>
 <1538751289-1109-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1538751289-1109-2-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjEwLjE4IGF0IDE2OjU0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQ2FsbCBpdCBmcm9tIHRoZSBoZWFkIG9mIGRvbWFpbl9jcmVhdGUoKSAoYmVmb3JlIGRv
aW5nIGFueSBtZW1vcnkKPiBhbGxvY2F0aW9ucyksIHdoaWNoIHdpbGwgYXBwbHkgdGhlIGNoZWNr
cyB0byBkb20wIGFzIHdlbGwgYXMgZG9tVSdzLgo+IAo+IEZvciBub3csIGp1c3Qgc3Vic3VtZSB0
aGUgWEVOX0RPTUNUTF9DREZfKiBjaGVjayBmcm9tIFhFTl9ET01DVExfY3JlYXRlZG9tYWluLgo+
IFRoaXMgbWVhbnMgdGhhdCB0aGUgY29ybmVyIGNhc2Ugb2YgdGhlIHRvb2xzdGFjayBwcm92aWRp
bmcgYmFkIGNvbmZpZ3VyYXRpb24KPiB3aWxsIGJ1cm4gYSBkb21pZCwgYnV0IHByb2R1Y3Rpb24g
c2V0dXBzIHNob3VsZG4ndCBldmVyIGdldCBpbnRvIHRoaXMKPiBzaXR1YXRpb24uCgoiQnVybiIg
YXMgaW4gInNraXAgaW4gdGhlIGN1cnJlbnQgcm91bmQiLCBub3QgYXMgaW4gImxlYWsiIGFmYWl1
PwoKPiAtLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jCj4gKysrIGIveGVuL2NvbW1vbi9kb21haW4u
Ywo+IEBAIC0yODgsNiArMjg4LDE4IEBAIHN0YXRpYyB2b2lkIF9kb21haW5fZGVzdHJveShzdHJ1
Y3QgZG9tYWluICpkKQo+ICAgICAgZnJlZV9kb21haW5fc3RydWN0KGQpOwo+ICB9Cj4gIAo+ICtz
dGF0aWMgaW50IGNoZWNrX2RvbWFpbl9jb25maWcoc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9t
YWluICpjb25maWcpCgpJIHdhcyB0ZW1wdGVkIHRvIGFzayBmb3IgdGhlIHBhcmFtZXRlciB0byBi
ZSBjb25zdGlmaWVkLCBidXQgc2luY2Ugb24KaXRzIG93biB0aGUgY29kZSBtb3ZlbWVudCBoZXJl
IG1ha2VzIG5vIHNlbnNlIChhbmQgdGhlIGRlc2NyaXB0aW9uCmFsc28gZG9lc24ndCBzdXBwbHkg
YW55IGhpbnQpLCBJJ3ZlIHBlZWtlZCBpbnRvIHBhdGNoIDIsIHdoZXJlIEkgZm91bmQKdGhhdCBB
cm0ncyBhcmNoX2NoZWNrX2RvbWFpbl9jb25maWcoKSBhY3R1YWxseSBtb2RpZmllcyB0aGUgY29u
ZmlnLgpXaXRoIHRoYXQgSSBkb24ndCBjb25zaWRlciAiY2hlY2siIHRoZSByaWdodCB0ZXJtIGZv
ciB0aGUgZnVuY3Rpb24gbmFtZTsKInNhbml0aXplIiBvciAibWFzc2FnZSIgcGVyaGFwcz8KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
