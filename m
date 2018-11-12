From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/badpage: Fix badpage->order overflow
Date: Mon, 12 Nov 2018 02:54:48 -0700
Message-ID: <5BE94DE802000078001FAB9F@prv1-mh.provo.novell.com>
References: <1541774575-31536-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1541774575-31536-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjExLjE4IGF0IDE1OjQyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gRm9yIG9yZGVyIDMyIG9yIG1vcmUsIHRoZSBzaGlmdCB3aWxsIHRydW5jYXRlLiAgU3Bv
dHRlZCBieSBDb3Zlcml0eS4KCkkgZmluZCB0aGlzIHByZXR0eSBhYnN1cmQuIFdoYXQgYWJvdXQg
b3JkZXIgNjQgb3IgbW9yZT8gQXJlIHlvdQpzdWdnZXN0aW5nIHlvdSBleHBlY3QgMTZUYiBvciBs
YXJnZXIgYmFkIHBhZ2UgcmFuZ2VzPwoKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKQW55d2F5LCBhcyBJIGRvbid0IG1pbmQgdGhlIGFk
anVzdG1lbnQKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkJ1dCBJ
J20gc3VyZSB5b3UncmUgYXdhcmUgd2UgaGF2ZSBtYW55IG1vcmUgZXhhbXBsZXMgb2YKMVUgKG9y
IGV2ZW4gcGxhaW4gMSkgZ2V0dGluZyBzaGlmdGVkIGJ5IGFuIG9yZGVyIHZhbHVlLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
