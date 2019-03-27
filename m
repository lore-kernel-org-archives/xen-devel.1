From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/6] xen/sched: call cpu_disable_scheduler()
 via cpu notifier
Date: Wed, 27 Mar 2019 10:22:14 -0600
Message-ID: <5C9BA336020000780022235B@prv1-mh.provo.novell.com>
References: <20190318131155.29450-1-jgross@suse.com>
 <20190318131155.29450-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0tC/=R6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9BJi-0005HO-8j
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 16:22:18 +0000
In-Reply-To: <20190318131155.29450-2-jgross@suse.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjAzLjE5IGF0IDE0OjExLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBAQCAt
MTczOCw2ICsxNzMzLDkgQEAgc3RhdGljIGludCBjcHVfc2NoZWR1bGVfY2FsbGJhY2soCj4gICAg
ICAgICAgcmMgPSBjcHVfc2NoZWR1bGVfdXAoY3B1KTsKPiAgICAgICAgICBicmVhazsKPiAgICAg
IGNhc2UgQ1BVX0RFQUQ6Cj4gKyAgICAgICAgcmN1X3JlYWRfbG9jaygmZG9tbGlzdF9yZWFkX2xv
Y2spOwo+ICsgICAgICAgIGNwdV9kaXNhYmxlX3NjaGVkdWxlcihjcHUpOwo+ICsgICAgICAgIHJj
dV9yZWFkX3VubG9jaygmZG9tbGlzdF9yZWFkX2xvY2spOwo+ICAgICAgICAgIFNDSEVEX09QKHNj
aGVkLCBkZWluaXRfcGRhdGEsIHNkLT5zY2hlZF9wcml2LCBjcHUpOwo+ICAgICAgICAgIC8qIEZh
bGx0aHJvdWdoICovCj4gICAgICBjYXNlIENQVV9VUF9DQU5DRUxFRDoKCmNwdV9kaXNhYmxlX3Nj
aGVkdWxlcigpIGhhcyBhIHJldHVybiB2YWx1ZSAoYW5kIGhlbmNlIG1lYW5zIHRvCmZhaWwpIC0g
aXMgaWdub3JpbmcgdGhpcyBoZXJlIHJlYWxseSBhcHByb3ByaWF0ZT8KCkFsc28gd2hpbGUgaW5k
ZWVkIChhcyB0aGUgZGVzY3JpcHRpb24gc2F5cykgdGhlcmUncyBubyBuZWVkIHRvCnJ1biB0aGUg
ZnVuY3Rpb24gb24gdGhlIENQVSBpdHNlbGYsIGl0J3Mgbm90IG9idmlvdXMgdG8gbWUgdGhhdApp
dCdzIHNhZmUgdG8gcnVuIGl0IG91dHNpZGUgb2Ygc3RvcF9tYWNoaW5lKCkgY29udGV4dC4gT3Ig
dG8gYmUKbW9yZSBwcmVjaXNlLCBpdCdzIG5vdCBjbGVhciB0byBtZSB0aGF0IGxlYXZpbmcgc3Rv
cF9tYWNoaW5lKCkKY29udGV4dCB3aXRoIHRoZSBhZGp1c3RtZW50cyBub3QgZG9uZSB5ZXQgaXMg
bm90IGdvaW5nIHRvCmxlYWQgdG8gcHJvYmxlbXMgKGR1ZSB0byB0aGUgZ2FwIGJldHdlZW4gbGVh
dmluZyB0aGF0IGNvbnRleHQKYW5kIGFjcXVpcmluZyB0aGUgUkNVIGxvY2spLiBDb3VsZCB5b3Ug
Y2xhcmlmeSB0aGlzIGluIHRoZQpkZXNjcmlwdGlvbiwgcGxlYXNlIChpZiBpdCBpbmRlZWQgaXMg
ZmluZSB0aGlzIHdheSk/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
