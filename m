From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 0/6] xen: simplify suspend/resume handling
Date: Tue, 2 Apr 2019 16:47:36 +0100
Message-ID: <92c04465-d737-0c5f-48c4-b3b7f1f1613d@citrix.com>
References: <20190402053457.24912-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QSF0=SE=citrix.com=prvs=9886cf734=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hBM12-0001hD-BA
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 16:12:00 +0000
In-Reply-To: <20190402053457.24912-1-jgross@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDQvMjAxOSAwNjozNCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBFc3BlY2lhbGx5IGlu
IHRoZSBzY2hlZHVsZXIgYXJlYSAoc2NoZWR1bGUuYywgY3B1cG9vbC5jKSB0aGVyZSBpcyBhCj4g
cmF0aGVyIGNvbXBsZXggaGFuZGxpbmcgaW52b2x2ZWQgd2hlbiBkb2luZyBzdXNwZW5kIGFuZCBy
ZXN1bWUuCj4KPiBUaGlzIGNhbiBiZSBzaW1wbGlmaWVkIGEgbG90IGJ5IG5vdCBwZXJmb3JtaW5n
IGEgY29tcGxldGUgY3B1IGRvd24gYW5kCj4gdXAgY3ljbGUgZm9yIHRoZSBub24tYm9vdCBjcHVz
LCBidXQga2VlcGluZyB0aGUgcHVyZSBzb2Z0d2FyZSByZWxhdGVkCj4gc3RhdGUgYW5kIGZyZWVp
bmcgaXQgb25seSBpbiBjYXNlIGEgY3B1IGRpZG4ndCBjb21lIHVwIGFnYWluIGR1cmluZwo+IHJl
c3VtZS4KPgo+IEluIHN1bW1hcnkgbm90IG9ubHkgdGhlIGNvbXBsZXhpdHkgY2FuIGJlIHJlZHVj
ZWQsIGJ1dCB0aGUgZmFpbHVyZQo+IHRvbGVyYW5jZSB3aWxsIGJlIGV2ZW4gYmV0dGVyIHdpdGgg
dGhpcyBzZXJpZXM6IFdpdGggYSBkZWRpY2F0ZWQgaG9vawo+IGZvciBmYWlsaW5nIGNwdXMgd2hl
biByZXN1bWluZyBpdCBpcyBub3cgcG9zc2libGUgdG8gc3Vydml2ZSBlLmcuIGEKPiBjcHVwb29s
IGJlaW5nIGxlZnQgd2l0aG91dCBhbnkgY3B1IGFmdGVyIHJlc3VtZSBieSBtb3ZpbmcgaXRzIGRv
bWFpbnMKPiB0byBjcHVwb29sMC4KPgo+IEp1ZXJnZW4gR3Jvc3MgKDYpOgo+ICAgeGVuL3NjaGVk
OiBjYWxsIGNwdV9kaXNhYmxlX3NjaGVkdWxlcigpIHZpYSBjcHUgbm90aWZpZXIKPiAgIHhlbjog
YWRkIGhlbHBlciBmb3IgY2FsbGluZyBub3RpZmllcl9jYWxsX2NoYWluKCkgdG8gY29tbW9uL2Nw
dS5jCj4gICB4ZW46IGFkZCBuZXcgY3B1IG5vdGlmaWVyIGFjdGlvbiBDUFVfUkVTVU1FX0ZBSUxF
RAo+ICAgeGVuOiBkb24ndCBmcmVlIHBlcmNwdSBhcmVhcyBkdXJpbmcgc3VzcGVuZAo+ICAgeGVu
L2NwdXBvb2w6IHNpbXBsaWZ5IHN1c3BlbmQvcmVzdW1lIGhhbmRsaW5nCj4gICB4ZW4vc2NoZWQ6
IGRvbid0IGRpc2FibGUgc2NoZWR1bGVyIG9uIGNwdXMgZHVyaW5nIHN1c3BlbmQKClNvIEkgY2Ft
ZSB0byB0cnkgYW5kIGNvbW1pdCB0aGlzIHNlcmllcy7CoCBIb3dldmVyLAoKW3Jvb3RAZnVzZWJv
dCB+XSMgeGVuLWhwdG9vbCBjcHUtb2ZmbGluZSAxClByZXBhcmUgdG8gb2ZmbGluZSBDUFUgMQpD
UFUgMSBvZmZsaW5lIGZhaWxlZCAoZXJyb3IgMTE6IFJlc291cmNlIHRlbXBvcmFyaWx5IHVuYXZh
aWxhYmxlKQpbcm9vdEBmdXNlYm90IH5dIyB4ZW4taHB0b29sIGNwdS1vZmZsaW5lIDIKUHJlcGFy
ZSB0byBvZmZsaW5lIENQVSAyCkNQVSAyIG9mZmxpbmUgZmFpbGVkIChlcnJvciAxMTogUmVzb3Vy
Y2UgdGVtcG9yYXJpbHkgdW5hdmFpbGFibGUpCltyb290QGZ1c2Vib3Qgfl0jCgpTb21ldGhpbmcg
aGVyZSBoYXMgcmVncmVzc2VkIGFsbCBhYmlsaXR5IHRvIGhvdHBsdWcuwqAgSXRzIG5vdAppbW1l
ZGlhdGVseSBvYnZpb3VzIHdoYXQuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
