From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v7 02/15] argo: introduce the argo_op
 hypercall boilerplate
Date: Mon, 4 Feb 2019 16:39:26 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1902041608190.22962@sstabellini-ThinkPad-X260>
References: <1548908900-1128-1-git-send-email-christopher.w.clark@gmail.com>
 <1548908900-1128-3-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fYof=QM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gqolt-0004lS-JR
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 00:39:29 +0000
In-Reply-To: <1548908900-1128-3-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAzMCBKYW4gMjAxOSwgQ2hyaXN0b3BoZXIgQ2xhcmsgd3JvdGU6Cj4gKyNpbmNsdWRl
IDx4ZW4vZXJybm8uaD4KPiArI2luY2x1ZGUgPHhlbi9ndWVzdF9hY2Nlc3MuaD4KPiArCj4gK2xv
bmcKPiArZG9fYXJnb19vcCh1bnNpZ25lZCBpbnQgY21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFN
KHZvaWQpIGFyZzEsCj4gKyAgICAgICAgICAgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBh
cmcyLCB1bnNpZ25lZCBsb25nIGFyZzMsCj4gKyAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhcmc0
KQo+ICt7Cj4gKyAgICByZXR1cm4gLUVOT1NZUzsKPiArfQo+ICsKPiArI2lmZGVmIENPTkZJR19D
T01QQVQKPiArbG9uZwo+ICtjb21wYXRfYXJnb19vcCh1bnNpZ25lZCBpbnQgY21kLCBYRU5fR1VF
U1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZzEsCj4gKyAgICAgICAgICAgICAgIFhFTl9HVUVTVF9I
QU5ETEVfUEFSQU0odm9pZCkgYXJnMiwgdW5zaWduZWQgbG9uZyBhcmczLAo+ICsgICAgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nIGFyZzQpCj4gK3sKPiArICAgIHJldHVybiAtRU5PU1lTOwo+ICt9
Cj4gKyNlbmRpZgoKRnJvbSBhbiBBUk0gcGVyc3BlY3RpdmUsIGl0IGlzIG5vdCBhIGdvb2QgaWRl
YSB0byB1c2UgdW5zaWduZWQgbG9uZyBhcwpoeXBlcmNhbGwgcGFyYW1ldGVycyBiZWNhdXNlIHRo
ZXkgYXJlIGdvaW5nIHRvIGJlIG9mIGRpZmZlcmVudCBzaXplIG9uCmFybTMyIGFuZCBhcm02NC4g
T24gQVJNLCB0aGVyZSBpcyBubyBDT01QQVQgY29kZSwgYW5kIHdlIHRyeSB0byBrZWVwIGEKc2lu
Z2xlIHN0YWJsZSBBQkkgYWNyb3NzIDMyYml0IGFuZCA2NGJpdCBoeXBlcnZpc29ycyAocG9pbnRl
cnMgc2l6ZQpiZWluZyB0aGUgb25seSBleGNlcHRpb24gYW5kIHdlIGRlYWwgd2l0aCB0aGF0IHVz
aW5nClhFTl9HVUVTVF9IQU5ETEVfUEFSQU0pLgoKRm9yIHRoaXMgcmVhc29uLCBnaXZlbiB0aGF0
IHdlIGRvbid0IG5lZWQgYXJnMyBhbmQgYXJnNCB0byBhY3R1YWxseSBiZQo2NGJpdCwgaXQgd291
bGQgYmUgYmVzdCB0byB1c2UgZXhwbGljaXRseSBzaXplZCBpbnRlZ2VycyBpbnN0ZWFkLiBJCndv
dWxkIHVzZSB1aW50MzJfdCBvciB1bnNpZ25lZCBpbnQgZm9yIGFyZzMgYW5kIGFyZzQuIFRoYXQg
d2F5LCB0aGVyZQphcmUgbm90IGdvaW5nIHRvIGJlIGFueSBBQkkgY29tcGF0aWJpbGl0eSBpc3N1
ZXMgYmV0d2VlbiBhcm0zMiBhbmQgYXJtNjQKYW5kIHdlIGNvdWxkIHJ1biwgYW5kIGV2ZW4gbWln
cmF0ZSwgMzJiaXQgZ3Vlc3RzIHRvIGEgNjRiaXQgaHlwZXJ2aXNvcgp3aXRob3V0IHByb2JsZW1z
LgoKSSBrbm93IHRoYXQgQW5kcmV3IGV4cHJlc3NlZCBjb25jZXJucyBhYm91dCB1c2luZyB1bnNp
Z25lZCBpbnQgYmVmb3JlLApidXQgZG9uJ3Qgd2UganVzdCBuZWVkIHRvIG1ha2Ugc3VyZSB3ZSBh
cmUgcHJvcGVybHkgaWdub3JpbmcgdGhlIHRvcAozMmJpdCBvZiBhcmczIGFuZCBhcmc0IHdoZW4g
dGhlIGh5cGVydmlzb3IgaXMgY29tcGlsZWQgNjRiaXQ/CgpJIGFtIHJlYWxseSBzb3JyeSBmb3Ig
cG9pbnRpbmcgdGhpcyBvdXQgc28gbGF0ZSBpbiB0aGUgcmV2aWV3IGN5Y2xlLCBidXQKSSBvbmx5
IHNwb3R0ZWQgaXQgbm93LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
