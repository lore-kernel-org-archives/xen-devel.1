From: Alexey G <x1917x@gmail.com>
Subject: Re: Slow HVM boot time, was "HVM boot time optimization"
Date: Fri, 16 Feb 2018 12:08:42 +1000
Message-ID: <20180216120842.00001cca@gmail.com>
References: <CABLtV0BqS_Y6oMt8TyCx55Nf9mB=-L7To+xY2on76p+1KDyXSQ@mail.gmail.com>
 <alpine.DEB.2.10.1802080826470.15787@sstabellini-ThinkPad-X260>
 <20180208164810.7h7equv4gfbjyzet@citrix.com>
 <20180208165600.GC1740@perard.uk.xensource.com>
 <20180208173233.6dejumgyqsz3ecjv@citrix.com>
 <CABLtV0Aq4JZfqZSZHYwsOp3PcebPhyQ90kQoqvxJid_2-owwHA@mail.gmail.com>
 <20180212144217.5iwogwdydfl7ehof@citrix.com>
 <CABLtV0DfAWpTHizHBpSqJZC9dk7UfWnOfq1OsBh9RSEReDax_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=tb+n=fk=gmail.com=x1917x@srs-us1.protection.inumbo.net>)
 id 1emVSO-00016h-VA
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 02:09:01 +0000
Received: by mail-lf0-x233.google.com with SMTP id v9so170331lfa.11
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2018 18:08:58 -0800 (PST)
In-Reply-To: <CABLtV0DfAWpTHizHBpSqJZC9dk7UfWnOfq1OsBh9RSEReDax_g@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Yessine Daoud <da.yessine@gmail.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAxNSBGZWIgMjAxOCAxNzowMjozNSArMDEwMApZZXNzaW5lIERhb3VkIDxkYS55ZXNz
aW5lQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEhlbGxvLAo+Cj5JIHRyaWVkIHRvIGRlYnVnIHRoZSBp
c3N1ZSBhbmQgdGhpcyB3aGF0IEkgZm91bmQ6Cj50aGUgSFZNIGJvb3QgdGFrZXMgc29tZSB0aW1l
IGF0IHRoZSBmb2xsb3dpbmcgc2VjdGlvbgo+KHFlbXUvcGMtYmlvcy9vcHRpb25yb20vbGludXhi
b290LlMpCj4vKiBMb2FkIGtlcm5lbCBhbmQgaW5pdHJkICovCj5yZWFkX2Z3X2Jsb2JfYWRkcjMy
X2VkaShGV19DRkdfSU5JVFJEKSAocmFtZGlzayBhYm91dCAzTSB0YWtlcyB+fjcucykKPnJlYWRf
ZndfYmxvYl9hZGRyMzIoRldfQ0ZHX0tFUk5FTCkgKHZtbGludXogYWJvdXQgN00gdGFrZXMgfn4x
NS5zKQo+cmVhZF9md19ibG9iX2FkZHIzMihGV19DRkdfQ01ETElORSkKPgo+I2RlZmluZSByZWFk
X2Z3X2Jsb2JfYWRkcjMyKHZhcikgXAo+cmVhZF9mdyB2YXIgIyMgX0FERFI7IFwKPm1vdiAlZWF4
LCAlZWRpOyBcCj5yZWFkX2Z3X2Jsb2JfcHJlKHZhcik7IFwKPi8qIG9sZCBhcygxKSBkb2Vzbid0
IGxpa2UgdGhpcyBpbnNuIHNvIGVtaXQgdGhlIGJ5dGVzIGluc3RlYWQ6IFwKPmFkZHIzMiByZXAg
aW5zYiAoJWR4KSwgJWVzOiglZWRpKTsgXAo+Ki8gXAo+LmRjLmIgMHg2NywweGYzLDB4NmMKPgo+
I2RlZmluZSByZWFkX2Z3X2Jsb2JfYWRkcjMyX2VkaSh2YXIpIFwKPnJlYWRfZndfYmxvYl9wcmUo
dmFyKTsgXAo+Lyogb2xkIGFzKDEpIGRvZXNuJ3QgbGlrZSB0aGlzIGluc24gc28gZW1pdCB0aGUg
Ynl0ZXMgaW5zdGVhZDogXAo+YWRkcjMyIHJlcCBpbnNiICglZHgpLCAlZXM6KCVlZGkpOyBcCj4q
LyBcCj4uZGMuYiAweDY3LDB4ZjMsMHg2Ywo+Cj5BbnkgaWRlYSBob3cgdG8gc3BlZWQgdGhlICBJ
L08gcmVhZCA/Cj5UaGFua3MuCgpIbW0sIGxvb2tzIGxpa2UgaXQgZG9lcyByZXAgaW5zYiB3aXRo
IGV2ZXJ5IEkvTyBpdGVyYXRpb24gZW11bGF0ZWQKaW5kaXZpZHVhbGx5IGZvciBzb21lIHJlYXNv
biwgaGVuY2UgaXRzIHNvIHNsb3cuIE5vcm1hbGx5IGl0IHNob3VsZCBiZQplbXVsYXRlZCBvbiBh
IGJ1ZmZlciBiYXNpcy4gVGhlcmUgbWlnaHQgYmUgYSBidWcgc29tZXdoZXJlIHdoaWNoIGNhdXNl
CnN0cmluZyBJL08gdG8gYmUgaGFuZGxlZCBieSBldmVyeSBpdGVyYXRpb24uCgpZb3UgbWF5IHRy
eSB0byBjb2xsZWN0IFFFTVUgdHJhY2UgbG9ncyB1c2luZyAKZGV2aWNlX21vZGVsX2FyZ3MgPSBb
Ii10cmFjZSIsICJldmVudHM9PHBhdGggdG8geW91ciBldmVudHMgZmlsZT4iXQpXaGVyZSB0aGUg
ZXZlbnRzIGZpbGUgc2hvdWxkIGNvbnRhaW4gbGluZXMgbGlrZSB0aGlzOgp4ZW5faW9yZXFfc2Vy
dmVyX2NyZWF0ZQp4ZW5faW9yZXFfc2VydmVyX2Rlc3Ryb3kKeGVuX2lvcmVxX3NlcnZlcl9zdGF0
ZQp4ZW5fbWFwX3BvcnRpb19yYW5nZQp4ZW5fdW5tYXBfcG9ydGlvX3JhbmdlCmNwdV9pb3JlcV9w
aW8KY3B1X2lvcmVxX3Bpb19yZWFkX3JlZwpjcHVfaW9yZXFfcGlvX3dyaXRlX3JlZwpoYW5kbGVf
aW9yZXEKaGFuZGxlX2lvcmVxX3JlYWQKaGFuZGxlX2lvcmVxX3dyaXRlCgpUaGUgcmVzdWx0aW5n
IGxvZyBmaWxlIGluIC92YXIvbG9nL3hlbiBtaWdodCBiZSBsYXJnZSAobWF5IGV2ZW4gcmVxdWly
ZQp0byBzcGVjaWZ5IFhFTl9RRU1VX0NPTlNPTEVfTElNSVQ9MCkgYnV0IHdpbGwgc2hvdyBob3cg
dGhlIHN0cmluZyBJL08Kd2l0aCBwb3J0IDUxMGggaXMgcHJvY2Vzc2VkLiBUaGlzIHNob3VsZCBu
YXJyb3cgdGhlIGlzc3VlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
