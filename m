From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/build-id: Fix xen_build_id_check() to
 be robust against malformed notes
Date: Mon, 7 Jan 2019 17:34:30 +0000
Message-ID: <9e49a9d5-0079-c3c8-ea21-5085bf7b6d96@citrix.com>
References: <1546277665-32720-1-git-send-email-andrew.cooper3@citrix.com>
 <5C332BC6020000780020AC6D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5C332BC6020000780020AC6D@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDEvMjAxOSAxMDozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMzEuMTIuMTgg
YXQgMTg6MzQsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gQSBOVF9HTlVf
QlVJTERfSUQgd2l0aCBuYW1lc3ogbG9uZ2VyIHRoYW4gNCB3aWxsIGNhdXNlIHRoZSBzdHJuY21w
KCkgdG8gdXNlCj4+IGJ5dGVzIGluIGFkamFjZW50IHN0cmluZ3RhYmxlIGVudHJpZXMuCj4+Cj4+
IEluc3RlYWQsIGNoZWNrIGZvciBuYW1lc3ogZXhhY3RseSBlcXVhbCB0byA0LAo+IElzIHRoYXQg
YSByZXF1aXJlbWVudCBzcGVsbGVkIG91dCBhbnl3aGVyZT8gVGlsbCBub3cgSSd2ZSBiZWVuCj4g
dW5kZXIgdGhlIGltcHJlc3Npb24gdGhhdCBlLmcuIDggYnl0ZXMgb2YgbmFtZSBhcmUgZmluZSBh
cyB3ZWxsLAo+IGFzIGxvbmcgYXMgdGhlIGZpcnN0IGZvdXIgb2YgdGhlbSBhcmUgIkdOVVwwIi4K
Ck5vIGlkZWEsIGJ1dCBpZiB0aGlzIGlzIHRydWUgdGhlbiB3ZSd2ZSBnb3QgYmlnZ2VyIHByb2Js
ZW1zIHdpdGggcGFyc2luZwp0aGUgbm90ZXMuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
