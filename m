From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 11/60] xen/sched: move per cpu scheduler
 private data into struct sched_resource
Date: Tue, 28 May 2019 05:32:14 -0600
Message-ID: <5CED1C3E0200007800233110@prv1-mh.provo.novell.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-12-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVaLB-0007mV-LW
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 11:32:25 +0000
In-Reply-To: <20190528103313.1343-12-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Robert VanVossen <Robert.VanVossen@dornerworks.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Joshua Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA1LjE5IGF0IDEyOjMyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBUaGlz
IHByZXBhcmVzIHN1cHBvcnQgb2YgbGFyZ2VyIHNjaGVkdWxpbmcgZ3JhbnVsYXJpdGllcywgZS5n
LiBjb3JlCj4gc2NoZWR1bGluZy4KPiAKPiBXaGlsZSBhdCBpdCBtb3ZlIHNjaGVkX2hhc191cmdl
bnRfdmNwdSgpIGZyb20gaW5jbHVkZS9hc20teDg2L2NwdWlkbGUuaAo+IGludG8gc2NoZWR1bGUu
YyByZW1vdmluZyB0aGUgbmVlZCBmb3IgaW5jbHVkaW5nIHNjaGVkLWlmLmggaW4KPiBjcHVpZGxl
LmggYW5kIG11bHRpcGxlIG90aGVyIEMgc291cmNlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoobWlub3IpIHg4NiBjaGFuZ2VzCkFja2VkLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cgo+IEBAIC0yMDc0LDYgKzIwNzIsMTYg
QEAgdm9pZCB3YWl0KHZvaWQpCj4gICAgICBzY2hlZHVsZSgpOwo+ICB9Cj4gIAo+ICsvKgo+ICsg
KiB2Y3B1IGlzIHVyZ2VudCBpZiB2Y3B1IGlzIHBvbGxpbmcgZXZlbnQgY2hhbm5lbAo+ICsgKgo+
ICsgKiBpZiB1cmdlbnQgdmNwdSBleGlzdHMsIENQVSBzaG91bGQgbm90IGVudGVyIGRlZXAgQyBz
dGF0ZQo+ICsgKi8KPiAraW50IHNjaGVkX2hhc191cmdlbnRfdmNwdSh2b2lkKQo+ICt7Cj4gKyAg
ICByZXR1cm4gYXRvbWljX3JlYWQoJmdldF9zY2hlZF9yZXMoc21wX3Byb2Nlc3Nvcl9pZCgpKS0+
dXJnZW50X2NvdW50KTsKPiArfQoKTWFrZSB0aGlzIGZ1bmN0aW9uJ3MgcmV0dXJuIHR5cGUgImJv
b2wiIGF0IHRoZSBzYW1lIHRpbWU/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
