From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/5] xen/domain: Break __domain_destroy()
 out of domain_create() and complete_domain_destroy()
Date: Mon, 03 Sep 2018 10:05:17 -0600
Message-ID: <5B8D5BBD02000078001E4C51@prv1-mh.provo.novell.com>
References: <1535986020-15906-1-git-send-email-andrew.cooper3@citrix.com>
 <1535986020-15906-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1535986020-15906-3-git-send-email-andrew.cooper3@citrix.com>
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

Pj4+IE9uIDAzLjA5LjE4IGF0IDE2OjQ2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2NvbW1vbi9kb21haW4uYwo+ICsrKyBiL3hlbi9jb21tb24vZG9tYWlu
LmMKPiBAQCAtMjYwLDYgKzI2MCwyMyBAQCBzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9leHRyYV9n
dWVzdF9pcnFzKGNvbnN0IGNoYXIgKnMpCj4gIH0KPiAgY3VzdG9tX3BhcmFtKCJleHRyYV9ndWVz
dF9pcnFzIiwgcGFyc2VfZXh0cmFfZ3Vlc3RfaXJxcyk7Cj4gIAo+ICsvKgo+ICsgKiBEZXN0cm95
IGEgZG9tYWluIG9uY2UgYWxsIHJlZmVyZW5jZXMgdG8gaXQgaGF2ZSBiZWVuIGRyb3BwZWQuICBV
c2VkIGVpdGhlcgo+ICsgKiBmcm9tIHRoZSBSQ1UgcGF0aCwgb3IgZnJvbSB0aGUgZG9tYWluX2Ny
ZWF0ZSgpIGVycm9yIHBhdGggYmVmb3JlIHRoZSBkb21haW4KPiArICogaXMgaW5zZXJ0ZWQgaW50
byB0aGUgZG9tbGlzdC4KPiArICovCj4gK3N0YXRpYyB2b2lkIF9fZG9tYWluX2Rlc3Ryb3koc3Ry
dWN0IGRvbWFpbiAqZCkKCldpdGgganVzdCBhIHNpbmdsZSBsZWFkaW5nIHVuZGVyc2NvcmUKQWNr
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
