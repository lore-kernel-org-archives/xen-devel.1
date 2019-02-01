From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.12 v2] arm: gic-v3: deactivate SGI/PPI
 during initialization
Date: Fri, 1 Feb 2019 10:40:38 +0000
Message-ID: <6a321d28-f456-8a0f-9336-e2c4f3bf87d3@arm.com>
References: <20190130140907.10548-1-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DrPi=QI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gpWFW-0007Ho-PH
 for xen-devel@lists.xenproject.org; Fri, 01 Feb 2019 10:40:42 +0000
In-Reply-To: <20190130140907.10548-1-peng.fan@nxp.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peng Fan <peng.fan@nxp.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "jgross@suse.com" <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpXZSBzcG9rZSBhYm91dCBTUElzIGluIHRoZSBwcmV2aW91cyB2ZXJzaW9uLiBXaHkgYXJl
bid0IHRoZXkgCmRlLWFjdGl2YXRlZCBoZXJlPwoKT24gMS8zMC8xOSAyOjAwIFBNLCBQZW5nIEZh
biB3cm90ZToKPiBPbiBpLk1YOCwgd2UgaW1wbGVtZW50ZWQgcGFydGl0aW9uIHJlYm9vdCB3aGlj
aCBtZWFucyBDb3J0ZXgtQSByZWJvb3QKPiB3aWxsIG5vdCBpbXBhY3QgTTQgY29yZXMgYW5kIFN5
c3RlbSBjb250cm9sIFVuaXQgY29yZS4gSG93ZXZlciBHSUN2Mwo+IGlzIG5vdCByZXNldCBiZWNh
dXNlIHdlIGFsc28gbmVlZCB0byBzdXBwb3J0IEE3MiBDbHVzdGVyIHJlYm9vdCB3aXRob3V0Cj4g
YWZmZWN0aW5nIEE1MyBDbHVzdGVyLgo+IAo+IFRoZSBnaWMtdjMgY29udHJvbGxlciBpcyBjb25m
aWd1cmVkIHdpdGggRU9JbW9kZSB0byAxLCBzbyBkdXJpbmcgeGVuCj4gcmVib290LCB0aGVyZSBp
cyBhIGZ1bmN0aW9uIGNhbGwgInNtcF9jYWxsX2Z1bmN0aW9uKGhhbHRfdGhpc19jcHUsIE5VTEws
IDApOyIKPiAsIGJ1dCBoYWx0X3RoaXNfY3B1IG5ldmVyIHJldHVybiwgdGhhdCBtZWFucyBvdGhl
ciBDUFVzIGhhdmUgbm8gY2hhbmNlIHRvCj4gZGVhY3RpdmF0ZSB0aGUgU0dJIGludGVycnVwdCwg
YmVjYXVzZSB0aGUgZGVhY3RpdmF0ZV9pcnEgb3BlcmF0aW9uIGlzIGF0Cj4gdGhlIGVuZCBvZiBk
b19zZ2kuIER1cmluZyB0aGUgbmV4dCBib290IG9mIFhlbiwgQ1BVMCB3aWxsIGlzc3VlCj4gR0lD
X1NHSV9DQUxMX0ZVTkNUSU9OIHRvIG90aGVyIENQVXMuIEFzIHRoZSBBY3RpdmUgc3RhdGUgZm9y
IFNHSSBpcyBsZWZ0Cj4gdW50b3VjaGVkIGR1cmluZyB0aGUgcmVib290LCB0aGUgR0lDX1NHSV9D
QUxMX0ZVTkNUSU9OIHdpbGwgc3RpbGwgYmUgYWN0aXZlCj4gb24gdGhlIG5vbi1ib290IENQVXMu
IFRoaXMgbWVhbnMgdGhlIGludGVycnVwdCBjYW5ub3QgYmUgdHJpZ2dlcmVkIGFnYWluCj4gdW50
aWwgaXQgZ2V0IGRlYWN0aXZhdGVkLgo+IAo+IEFuZCBhY2NvcmRpbmcgdG8gSUhJMDA2OURfZ2lj
X2FyY2hpdGVjdHVyZV9zcGVjaWZpY2F0aW9uLCBjaGFwdGVyCj4gIjguMTEuMyBHSUNSX0lDQUNU
SVZFUjAsIEludGVycnVwdCBDbGVhci1BY3RpdmUgUmVnaXN0ZXIgMCIsIHRoZSBSVwo+IGZpZWxk
IG9mIEdJQ1JfSUNBQ1RJVkVSMCByZXNldHMgdG8gYSB2YWx1ZSB0aGF0IGlzIGFyY2hpdGVjdHVy
YWxseSBVTktOT1dOLgo+IAo+IFNvIHNldCBhIGZpeGVkIHZhbHVlIGR1cmluZyBnaWMtdjMgaW5p
dGlhbGl6YXRpb24gdG8gbWFrZSBzdXJlCj4gaW50ZXJydXB0cyBhcmUgaW4gZGVhY3RpdmF0ZWQg
c3RhdGUuCgpJdCBpcyBhIGJpdCB1bmNsZWFyIHdoYXQgeW91IG1lYW4gYnkgImZpeGVkIHZhbHVl
IiBoZXJlLiBUaGUgb25seSB0aGluZyAKeW91IGRvIGlzIGNsZWFyaW5nIGFjdGl2ZSBzdGF0ZS4g
U28gYSBiZXR0ZXIgd29yZGluZyBpcyAiU28gbWFrZSBzdXJlIAphbGwgaW50ZXJydXB0cyBhcmUg
ZGVhY3RpdmF0ZWQgYXQgZHVyaW5nIGluaXRpYWxpemF0aW9uIGJ5IGNsZWFyaW5nIHRoZSAKc3Rh
dGUiLgoKSG93IGFib3V0IFNQSXM/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
