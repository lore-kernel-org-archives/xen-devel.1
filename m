From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 01/44] x86emul: support AVX512 opmask
 insns
Date: Wed, 26 Sep 2018 00:06:19 -0600
Message-ID: <5BAB21DB02000078001EBF2D@prv1-mh.provo.novell.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5BAA34B502000078001EB9B6@prv1-mh.provo.novell.com>
 <5BAA376102000078001EB9C9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=an3h=mi=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g52y3-0002FL-3O
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 06:06:35 +0000
In-Reply-To: <5BAA376102000078001EB9C9@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjA5LjE4IGF0IDE1OjI1LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+IFRo
ZXNlIGFyZSBhbGwgVkVYIGVuY29kZWQsIHNvIHRoZSBFVkVYIGRlY29kaW5nIGxvZ2ljIGNvbnRp
bnVlcyB0bwo+IHJlbWFpbiB1bnVzZWQgYXQgdGhpcyBwb2ludC4KPiAKPiBUaGUgbmV3IHRlc3Rj
YXNlIGlzIGRlbGliZXJhdGVseSBjb2RlZCBpbiBhc3NlbWJseSwgYXMgYSBDIG9uZSB3b3VsZAo+
IGhhdmUgYmVjb21lIGFsbW9zdCB1bnJlYWRhYmxlIGR1ZSB0byB0aGUgb3ZlcndoZWxtaW5nIGFt
b3VudCBvZgo+IF9fYnVpbHRpbl8uLi4oKSB0aGF0IHdvdWxkIG5lZWQgdG8gYmUgdXNlZC4gQWZ0
ZXIgYWxsIHRoZSBjb21waWxlciBoYXMKPiBubyB1bmRlcmx5aW5nIHR5cGUgKHlldCkgdGhhdCBj
b3VsZCBiZSBvcGVyYXRlZCBvbiB3aXRob3V0IGJ1aWx0aW5zLAo+IG90aGVyIHRoYW4gdGhlIHZl
Y3RvciB0eXBlcyB1c2VkIGZvciAibm9ybWFsIiBTSU1EIGluc25zLgoKSSd2ZSBhZGRlZAoKIk5v
dGUgdGhhdCBvdXRzaWRlIG9mIDY0LWJpdCBtb2RlIGFuZCBkZXNwaXRlIHRoZSBTRE0gbm90IGN1
cnJlbnRseQogc2F5aW5nIHNvLCBWRVguVyBpcyBpZ25vcmVkIGZvciB0aGUgS01PVntELFF9IGVu
Y29kaW5ncyB0by9mcm9tIEdQUnMsCiBqdXN0IGxpa2UgZS5nLiBmb3IgdGhlIHNpbWlsYXIgVk1P
VntELFF9LiIKCmhlcmUsIHRvIGNsYXJpZnkgd2h5IHRoZSBpbXBsZW1lbnRhdGlvbiBkb2VzIG5v
dCBzZWVtIHRvIG1hdGNoIHRoZQpTRE0gaW4gdGhpcyByZWdhcmQuIEkndmUgYXNrZWQgSW50ZWwg
dG8gY29ycmVjdCB0aGUgU0RNLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
