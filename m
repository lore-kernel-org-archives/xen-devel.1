From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 07/13] libx86: Introduce a helper to
 serialise msr_{domain, vcpu}_policy objects
Date: Wed, 04 Jul 2018 03:16:41 -0600
Message-ID: <5B3C907902000078001D0EDD@prv1-mh.provo.novell.com>
References: <1530651326-5320-1-git-send-email-andrew.cooper3@citrix.com>
 <1530651326-5320-8-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1530651326-5320-8-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA3LjE4IGF0IDIyOjU1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gRnJvbTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gCj4g
QXMgd2l0aCBDUFVJRCwgdGhlIGFuIGFyY2hpdGVjdHVyYWwgZm9ybSBpcyB1c2VkIGZvciByZXBy
ZXNlbnRpbmcgdGhlIE1TUgoKU3RyYXkgInRoZSIuCgpBcGFydCBmcm9tIHRoYXQgc2FtZSByZW1h
cmsocykgYXMgZm9yIHRoZSByZXNwZWN0aXZlIENQVUlEIGNoYW5nZSwKcGx1cyAuLi4KCj4gQEAg
LTMyNSw2ICszMjUsMTMgQEAgdHlwZWRlZiBzdHJ1Y3QgeGVuX2NwdWlkX2xlYWYgewo+ICB9IHhl
bl9jcHVpZF9sZWFmX3Q7Cj4gIERFRklORV9YRU5fR1VFU1RfSEFORExFKHhlbl9jcHVpZF9sZWFm
X3QpOwo+ICAKPiArdHlwZWRlZiBzdHJ1Y3QgeGVuX21zcl9lbnRyeSB7Cj4gKyAgICB1aW50MzJf
dCBpZHg7Cj4gKyAgICB1aW50MzJfdCBmbGFnczsgLyogUmVzZXJ2ZWQgTUJaLiAqLwoKLi4uIGl0
IHJlbWFpbnMgdW5jbGVhciBpbiB0aGlzIHBhdGNoIHdob3NlIHJlc3BvbnNpYmlsaXR5IGl0IGlz
IHRvIGNsZWFyIHRoaXMKZmllbGQuIEkgd29uZGVyIHdoZXRoZXIgY29weV9tc3JfdG9fYnVmZmVy
KCkgc2hvdWxkIG1ha2Ugc3VyZSBvZiB0aGlzLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
