From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12] pvh/dom0: fix deadlock in GSI
 mapping
Date: Mon, 28 Jan 2019 09:19:57 -0700
Message-ID: <5C4F2BAD0200007800211D61@prv1-mh.provo.novell.com>
References: <20190128142245.34923-1-roger.pau@citrix.com>
 <5C4F1FFA0200007800211CE9@prv1-mh.provo.novell.com>
 <20190128155236.zheuammgnwivufuf@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ayfn=QE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1go9dk-0005sA-E6
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 16:20:04 +0000
In-Reply-To: <20190128155236.zheuammgnwivufuf@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjAxLjE5IGF0IDE2OjUyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgSmFuIDI4LCAyMDE5IGF0IDA4OjMwOjAyQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMjguMDEuMTkgYXQgMTU6MjIsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gSW4gb3JkZXIgdG8gc29sdmUgaXQgbW92ZSB0aGUgdmlvYXBpY19od2RvbV9t
YXBfZ3NpIG91dHNpZGUgb2YgdGhlCj4+ID4gbG9ja2VkIHJlZ2lvbiBpbiB2aW9hcGljX3dyaXRl
X3JlZGlyZW50LiB2aW9hcGljX2h3ZG9tX21hcF9nc2kgd2lsbAo+PiA+IG5vdCBhY2Nlc3MgYW55
IG9mIHRoZSB2aW9hcGljIGZpZWxkcywgc28gdGhlcmUncyBubyBuZWVkIHRvIGNhbGwgdGhlCj4+
ID4gZnVuY3Rpb24gaG9sZGluZyB0aGUgaHZtLmlycV9sb2NrLgo+PiAKPj4gVHJ1ZSwgYnV0IHlv
dSBhbHNvIG1vdmUgdGhlIGNvZGUgYWNyb3NzIGEgdmlvYXBpY19kZWxpdmVyKCkKPj4gaW52b2Nh
dGlvbi4gSXMgdGhhdCBkZWxpdmVyeSBnb2luZyB0byB3b3JrIHdoZW4KPj4gdmlvYXBpY19od2Rv
bV9tYXBfZ3NpKCkgZ2V0cyBpbnZva2VkIG9ubHkgYWZ0ZXJ3YXJkcz8KPiAKPiBZZXMsIHRoYXQg
dmlvYXBpY19kZWxpdmVyIHdpbGwgb25seSBnZXQgaW52b2tlZCB3aGVuIHRoZXJlJ3MgYSBwZW5k
aW5nCj4gZ3NpIChodm1faXJxLT5nc2lfYXNzZXJ0X2NvdW50W2lkeF0gPiAwKSwgYW5kIHRoYXQg
Y2FuIG9ubHkgaGFwcGVuCj4gb25jZSB0aGUgaGFyZHdhcmUgZ3NpIGlzIGJvdW5kIHRvIGRvbTAg
YW5kIHRoZSBodm0uaXJxX2xvY2sgaGFzIGJlZW4KPiByZWxlYXNlZCwgc28gdGhhdCB0aGUgZHBj
aSBzb2Z0aXJxIGNhbiBpbmNyZWFzZSB0aGUgZ3NpIGFzc2VydCBjb3VudC4KCk9oLCBJIGhhZCBv
dmVybG9va2VkIHRoZSAtRUVYSVNUIGVhcmx5IGJhaWwgZnJvbQp2aW9hcGljX2h3ZG9tX21hcF9n
c2koKSwgd3JvbmdseSBpbXBseWluZyB0aGlzIGNvdWxkIGJlCmEgcHJvYmxlbSB3aXRoIG90aGVy
IHRoYW4gdGhlIGluaXRpYWwgd3JpdGUgb2YgYW4gUlRFLgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
