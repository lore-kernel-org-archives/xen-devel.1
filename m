From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/hvm: finish IOREQ correctly on
 completion path
Date: Mon, 11 Mar 2019 07:58:50 -0600
Message-ID: <5C86699A020000780021D3BC@prv1-mh.provo.novell.com>
References: <1552080650-9168-1-git-send-email-igor.druzhinin@citrix.com>
 <71b6e1dee81b499a90e4b24b1989abf6@AMSPEX02CL02.citrite.net>
 <5C864097020000780021D280@prv1-mh.provo.novell.com>
 <e24e9bf8facd446189376c35bd9b32b0@AMSPEX02CL02.citrite.net>
 <5C864762020000780021D2A9@prv1-mh.provo.novell.com>
 <2830bbcb659140119a96d6d851316dba@AMSPEX02CL02.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dzfJ=RO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h3LSD-0002AA-9z
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 13:58:57 +0000
In-Reply-To: <2830bbcb659140119a96d6d851316dba@AMSPEX02CL02.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Igor Druzhinin <igor.druzhinin@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjAzLjE5IGF0IDEyOjM5LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IE9rLCB0aGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLiBTbywgdGhlIHByb2JsZW0gaXMg
dGhhdCBtZW1vcnkgYWNjZXNzZXMgCj4gYXJlIG5vdCBzdGFzaGVkICh1bmRlcnN0YW5kYWJseSBJ
IGd1ZXNzKSBpbiB0aGUgbW1pb19jYWNoZS4gSWYgdGhleSB3ZXJlIHRoZW4gCj4gZm9yY2luZyB0
aGUgY29kZSBkb3duIHRoZSBNTUlPIHBhdGggd291bGQgd29yay4gU28sIHdoYXQgd2UgcHJvYmFi
bHkgbmVlZCBpcyAKPiBhIGNhY2hlIG9mIGFsbCBhY2Nlc3NlcyB0aGF0IGFuIGluc3RydWN0aW9u
IGhhcyBtYWRlIHRvIGRhdGUsIHJlZ2FyZGxlc3Mgb2YgCj4gd2hldGhlciB0aGV5IGhpdCBSQU0g
b3IgSS9PIGVtdWxhdGlvbi4KClJpZ2h0LCBhbmQgdGhhdCdzIHRoZSBwbGFuIEkgaGF2ZSBhbnl3
YXkgd2hlbiByZXdvcmtpbmcgbXkgc2VyaWVzCiJ4ODYvSFZNOiBpbXBsZW1lbnQgbWVtb3J5IHJl
YWQgY2FjaGluZyIgaG9wZWZ1bGx5IG1vcmUgdG8KQW5kcmV3J3MgbGlraW5nLiBCdXQgdGhpcyBp
cyBnb2luZyB0byB0YWtlIHNvbWUgdGltZSwgYW5kIGhlbmNlIHRoZQpob3BlIHdhcyB0byBoYXZl
IHNvbWUgc2hvcnQgdGVybSBmaXggYWRkcmVzc2luZyBhdCBsZWFzdCB0aGUgc3BlY2lmaWMKcDJt
X2lvcmVxX3NlcnZlciBpc3N1ZSBhdCBoYW5kLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
