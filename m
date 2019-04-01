From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC 17/49] xen/sched: move some per-vcpu
 items to struct sched_item
Date: Mon, 01 Apr 2019 02:41:48 -0600
Message-ID: <5CA1CECC0200007800223785@prv1-mh.provo.novell.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-18-jgross@suse.com>
 <ad9f514b-7325-0759-0a80-c8195e8c0b64@citrix.com>
 <cd2b85ff-ccc7-e261-a4b5-6a5f56e98e2a@suse.com>
 <05874d79-0470-2895-d231-c56ddd834dde@suse.com>
 <5CA1C63402000078002236F5@prv1-mh.provo.novell.com>
 <3fd55965-52dc-7680-496a-7308ab166818@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hAsVx-0004PY-JK
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 08:41:57 +0000
In-Reply-To: <3fd55965-52dc-7680-496a-7308ab166818@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjA0LjE5IGF0IDEwOjI2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gV2hpbGUgSSBkaWQgc3VnZ2VzdCB0aGlzIG9yaWdpbmFsbHksIEkgdG9vIGFtIGEgbGl0
dGxlIHdhcnkgYWJvdXQgdGhlCj4gc2NvcGUgY3JlZXAuCj4gCj4gSWYgbW92aW5nIGV2ZXJ5dGhp
bmcgaXMgdG9vIG11Y2gsIGNhbiB3ZSBhdCBsZWFzdCB0cnkgdG8gbm90IG1ha2UgdGhlCj4gc2No
ZWQtaWYuaCBzaXR1YXRpb24gYW55IHdvcnNlIHRoYW4gaXQgY3VycmVudGx5IGlzLgoKKzEKCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
