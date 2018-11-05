From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2] x86/vcpu: Remove struct vcpu allocation
 restriction when possible
Date: Mon, 5 Nov 2018 13:39:20 +0000
Message-ID: <cd3aa617-e62e-8fca-53e4-fe03d7f65022@arm.com>
References: <1541423850-8873-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1541423850-8873-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwNS8xMS8yMDE4IDEzOjE3LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IFRoZXJlIGlz
IG5vIG5lZWQgZm9yIHN0cnVjdCB2Y3B1IHRvIGxpdmUgYmVsb3cgdGhlIDRHIGJvdW5kYXJ5IGZv
ciBQViBndWVzdHMsCj4gb3IgZm9yIEhWTSB2Y3B1cyB1c2luZyBIQVAuCj4gCj4gUGx1bWIgc3Ry
dWN0IGRvbWFpbiBpbnRvIGFsbG9jX3ZjcHVfc3RydWN0KCkgc28gdGhlIHg4NiB2ZXJzaW9uIGNh
biBxdWVyeSB0aGUKPiBkb21haW4ncyB0eXBlIGFuZCBwYWdpbmcgc2V0dGluZ3MuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAt
LS0KPiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgo+IENDOiBXZWkgTGl1IDx3
ZWkubGl1MkBjaXRyaXguY29tPgo+IENDOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1
LmNpdHJpeC5jb20+Cj4gQ0M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgo+IENDOiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ0M6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gCj4gdjI6Cj4gICAqIFBsdW1iIHN0cnVjdCBkb21haW4g
aW50byBhbGxvY192Y3B1X3N0cnVjdCgpCj4gLS0tCj4gICB4ZW4vYXJjaC9hcm0vZG9tYWluLmMg
ICAgfCAyICstCgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
