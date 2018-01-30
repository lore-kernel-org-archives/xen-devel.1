From: Christian Lindig <christian.lindig@citrix.com>
Subject: Re: [PATCH RFC] ocaml: Fix compile with ocaml 4.06,
 use unsafe strings
Date: Tue, 30 Jan 2018 09:26:51 +0000
Message-ID: <FEEA61CD-80E5-4963-8CEB-776937BB0C5E@citrix.com>
References: <20180126085208.15212-1-git@johnthomson.fastmail.com.au>
 <alpine.LFD.2.21.1801260903220.28542@algedi.dur.ac.uk>
 <DD256C43-6511-4327-A611-DDE1784764E7@citrix.com>
 <20180126114306.mpklwqjlworpuewf@citrix.com>
 <0079C722-DC8F-4930-8E85-42DAE5E8C979@citrix.com>
 <20180126120056.7sijtmdm53drvip2@citrix.com>
 <E618870F-03B7-4993-8975-E7BAB4767B2E@citrix.com>
 <1517009026.1156477.1249669224.5B9AA859@webmail.messagingengine.com>
 <alpine.LFD.2.21.1801281741180.4681@austen3.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=qorm=ez=citrix.com=prvs=561512251=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1egSBv-0001LE-HU
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2018 09:26:59 +0000
In-Reply-To: <alpine.LFD.2.21.1801281741180.4681@austen3.home>
Content-Language: en-US
Content-ID: <FE063CF1EDC15040B39CB03003532F4E@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michael Young <m.a.young@durham.ac.uk>
Cc: Marcello Seri <marcello.seri@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, John Thomson <git@johnthomson.fastmail.com.au>, David Scott <dave@recoil.org>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gMjguIEphbiAyMDE4LCBhdCAyMzo0NCwgTWljaGFlbCBZb3VuZyA8bS5hLnlvdW5n
QGR1cmhhbS5hYy51az4gd3JvdGU6DQo+IA0KPj4gDQo+PiBJIGRvIG5vdCBrbm93IGlmIGNhbWwt
c3R1YmRvbSB1c2VzIGFueSBvZiB0aGVzZSBmaWxlcywgYnV0IGl0IHNlZW1zIHRvIHVzZSBvY2Ft
bC0zLjExLjA/DQo+PiBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDth
PWJsb2I7Zj1zdHViZG9tL2NvbmZpZ3VyZTtoPWE3YTBjMDkxNTQ0MGI3YjM1MWE3YWRmNGY0MGM4
ZjllZThlNzM5ZWY7aGI9cmVmcy9oZWFkcy9zdGFnaW5nI2wzNTM0DQo+IA0KPiBJZiB3ZSBjaGFu
Z2UgdGhpcyBzaG91bGQgaXQgYmUgdGhlIGVhcmxpZXN0IHZlcnNpb24gdGhlIGNvZGUgd2lsbCBz
dXBwb3J0ICg0LjAyKSBvciB0aGUgbGF0ZXN0ICg0LjA2KT8NCg0KSSB0aGluayB0aGlzIHNob3Vs
ZCBiZSA0LjAyIC0gZXNwZWNpYWxseSBiZWNhdXNlIHRoZSBPQ2FtbCBjb21waWxlciBpbiB2ZXJz
aW9ucyA0LjA1IGFuZCA0LjA2IGhhZCBzb21lIGJ1Z3MgdGhhdCBhcmUgbm93IGJlaW5nIGlyb25l
ZCBvdXQuDQoNCuKAlCBDaHJpc3RpYW4NCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
