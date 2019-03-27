From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 5/6] xen/cpupool: simplify suspend/resume
 handling
Date: Wed, 27 Mar 2019 15:56:21 +0000
Message-ID: <4219ace0-133a-a26c-5fba-9e954258a809@citrix.com>
References: <20190318131155.29450-1-jgross@suse.com>
 <20190318131155.29450-6-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sq4U=R6=citrix.com=prvs=98279bc35=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1h9Auv-0001j0-8q
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 15:56:41 +0000
In-Reply-To: <20190318131155.29450-6-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMy8xOC8xOSAxOjExIFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IEluc3RlYWQgb2YgcmVt
b3ZpbmcgY3B1cyB0ZW1wb3JhcmlseSBmcm9tIGNwdXBvb2xzIGR1cmluZwo+IHN1c3BlbmQvcmVz
dW1lIG9ubHkgcmVtb3ZlIGNwdXMgZmluYWxseSB3aGljaCBkaWRuJ3QgY29tZSB1cCB3aGVuCj4g
cmVzdW1pbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPgoKTG9va3MgZ29vZCBvdmVyYWxsIC0tIG9uZSBjb21tZW50Li4uCgo+IEBAIC03NzQsMTAg
Kzc0MSwxNSBAQCBzdGF0aWMgaW50IGNwdV9jYWxsYmFjaygKPiAgICAgIHsKPiAgICAgIGNhc2Ug
Q1BVX0RPV05fRkFJTEVEOgo+ICAgICAgY2FzZSBDUFVfT05MSU5FOgo+IC0gICAgICAgIHJjID0g
Y3B1cG9vbF9jcHVfYWRkKGNwdSk7Cj4gKyAgICAgICAgaWYgKCBzeXN0ZW1fc3RhdGUgPD0gU1lT
X1NUQVRFX2FjdGl2ZSApCj4gKyAgICAgICAgICAgIHJjID0gY3B1cG9vbF9jcHVfYWRkKGNwdSk7
Cj4gICAgICAgICAgYnJlYWs7Cj4gICAgICBjYXNlIENQVV9ET1dOX1BSRVBBUkU6Cj4gLSAgICAg
ICAgcmMgPSBjcHVwb29sX2NwdV9yZW1vdmUoY3B1KTsKPiArICAgICAgICBpZiAoIHN5c3RlbV9z
dGF0ZSA8PSBTWVNfU1RBVEVfYWN0aXZlICkKPiArICAgICAgICAgICAgcmMgPSBjcHVwb29sX2Nw
dV9yZW1vdmUoY3B1KTsKPiArICAgICAgICBicmVhazsKPiArICAgIGNhc2UgQ1BVX1JFU1VNRV9G
QUlMRUQ6Cj4gKyAgICAgICAgY3B1cG9vbF9jcHVfcmVtb3ZlX2ZvcmNlZChjcHUpOwo+ICAgICAg
ICAgIGJyZWFrOwo+ICAgICAgZGVmYXVsdDoKCkl0IHdvdWxkIGJlIGdvb2QgdG8gaGF2ZSBzb21l
IGNvbW1lbnRzIGhlcmUganVzdCBleHBsYWluaW5nIHRoaXM7IG1heWJlCmp1c3QgdG8gdGhlIGVm
ZmVjdCBvZiwgIlN1c3BlbmQvcmVzdW1lIG9wZXJhdGlvbnMgZG9uJ3QgYWZmZWN0IGNwdXBvb2wK
cGxhY2VtZW50Ii4KCldpdGggdGhhdDoKClJldmlld2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9y
Z2UuZHVubGFwQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
