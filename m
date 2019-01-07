From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/build-id: Fix xen_build_id_check() to
 be robust against malformed notes
Date: Mon, 07 Jan 2019 03:36:54 -0700
Message-ID: <5C332BC6020000780020AC6D@prv1-mh.provo.novell.com>
References: <1546277665-32720-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1546277665-32720-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjEyLjE4IGF0IDE4OjM0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQSBOVF9HTlVfQlVJTERfSUQgd2l0aCBuYW1lc3ogbG9uZ2VyIHRoYW4gNCB3aWxsIGNh
dXNlIHRoZSBzdHJuY21wKCkgdG8gdXNlCj4gYnl0ZXMgaW4gYWRqYWNlbnQgc3RyaW5ndGFibGUg
ZW50cmllcy4KPiAKPiBJbnN0ZWFkLCBjaGVjayBmb3IgbmFtZXN6IGV4YWN0bHkgZXF1YWwgdG8g
NCwKCklzIHRoYXQgYSByZXF1aXJlbWVudCBzcGVsbGVkIG91dCBhbnl3aGVyZT8gVGlsbCBub3cg
SSd2ZSBiZWVuCnVuZGVyIHRoZSBpbXByZXNzaW9uIHRoYXQgZS5nLiA4IGJ5dGVzIG9mIG5hbWUg
YXJlIGZpbmUgYXMgd2VsbCwKYXMgbG9uZyBhcyB0aGUgZmlyc3QgZm91ciBvZiB0aGVtIGFyZSAi
R05VXDAiLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
