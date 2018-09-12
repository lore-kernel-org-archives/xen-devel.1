From: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v2] xen/vcpu: Rework sanity checks in
 vcpu_create()
Date: Wed, 12 Sep 2018 07:38:14 -0400
Message-ID: <CAKf6xpsibcTU7_aXzQk+nRKonSFZf_YQ5npevGyes_j33_x1ZQ@mail.gmail.com>
References: <1536261934-1236-4-git-send-email-andrew.cooper3@citrix.com>
 <1536684371-1417-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1536684371-1417-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: sstabellini@kernel.org, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org, julien.grall@arm.com, Jan Beulich <JBeulich@suse.com>, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMTEsIDIwMTggYXQgMTI6NDggUE0gQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBQb2lzb25pbmcgaWRsZV92Y3B1WzBdIHdpdGgg
dGhlIHNhbml0eSBkZWJ1ZyB2YWx1ZSBpc24ndCBhY3R1YWxseSBhIGNsZXZlcgo+IGlkZWEsIGJl
Y2F1c2UgaXQgcGFzc2VzIGEgTlVMTCBwb2ludGVyIGNoZWNrIGJ1dCBpc24ndCBhIHVzYWJsZSB2
Y3B1LiAgSXQgaXMKPiBhbHNvIHRoZSByZWFzb24gZm9yIHRoZSAoIWlzX2lkbGVfZG9tYWluKGQp
IHx8IHZjcHVfaWQpIHBhcnQgb2YgdGhlIGV4aXN0aW5nCj4gc2FuaXR5IEJVR19PTigpLgo+Cj4g
Tm93IHRoYXQgZC0+bWF4X3ZjcHVzIGlzIGFwcHJvcHJpYXRlbHkgc2V0IHVwIGJlZm9yZSB2Y3B1
X2NyZWF0ZSgpIGlzIGNhbGxlZCwKPiB3ZSBjYW4gcHJvcGVybHkgcmFuZ2UgY2hlY2sgdGhlIHJl
cXVlc3RlZCB2Y3B1X2lkLiAgRHJvcCB0aGUgQlVHX09OKCkgYW5kCj4gcmVwbGFjZSBpdCB3aXRo
IGNvZGUgd2hpY2ggaXMgcnVudGltZSBzYWZlIGJ1dCBub24tZmF0YWwuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IC0tLQo+IEND
OiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4gQ0M6IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+Cj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pgo+IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ0M6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gQ0M6IEphc29uIEFuZHJ5dWsg
PGphbmRyeXVrQGdtYWlsLmNvbT4KPgo+IHYyOgo+ICAqIEZpeCB0aGUgdGJvb3QgY2hlY2sgZm9s
bG93aW5nIHRoZSB1bi1wb2lzaW9uaW5nIG9mIGlkbGVfdmNwdVswXQo+ICAqIEV4Y2x1ZGUgdGhl
IGlkbGUgZG9tYWluIGZyb20gdGhlIG5leHRfaW5fbGlzdCBsaXN0LCBhbmQgdmFzdGx5IHNpbXBs
aWZ5IHRoZQo+ICAgIGxpbmtpbmcgbG9naWMuCgpSZXZpZXdlZC1ieTogSmFzb24gQW5kcnl1ayA8
amFuZHJ5dWtAZ21haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
