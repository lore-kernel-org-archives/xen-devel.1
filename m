From: Christian Lindig <christian.lindig@citrix.com>
Subject: Re: [PATCH RFC] ocaml: Fix compile with ocaml 4.06,
 use unsafe strings
Date: Fri, 26 Jan 2018 13:16:58 +0000
Message-ID: <E618870F-03B7-4993-8975-E7BAB4767B2E@citrix.com>
References: <20180126085208.15212-1-git@johnthomson.fastmail.com.au>
 <alpine.LFD.2.21.1801260903220.28542@algedi.dur.ac.uk>
 <DD256C43-6511-4327-A611-DDE1784764E7@citrix.com>
 <20180126114306.mpklwqjlworpuewf@citrix.com>
 <0079C722-DC8F-4930-8E85-42DAE5E8C979@citrix.com>
 <20180126120056.7sijtmdm53drvip2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zvi/=ev=citrix.com=prvs=557898145=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1ef3sQ-0006z6-PW
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2018 13:17:06 +0000
In-Reply-To: <20180126120056.7sijtmdm53drvip2@citrix.com>
Content-Language: en-US
Content-ID: <4962F64EDDF5A94D8329392ED4D98D87@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Marcello Seri <marcello.seri@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>, John Thomson <git@johnthomson.fastmail.com.au>, M A Young <m.a.young@durham.ac.uk>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gMjYuIEphbiAyMDE4LCBhdCAxMjowMCwgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT4gd3JvdGU6DQo+IA0KPj4gDQo+PiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIExpbmRpZyA8
Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPg0KPj4gDQo+IA0KPiBUYWtpbmcgdGhlIGFib3Zl
IGludG8gY29uc2lkZXJhdGlvbiwgZG9lcyB0aGlzIHRhZyBzdGlsbCBzdGFuZD8NCg0KVGhhbmtz
IGZvciB0aGUgY2xhcmlmaWNhdGlvbi4gTXkgdGFnIHN0aWxsIHN0YW5kcyBhcyB0aGUgY29kZSBp
biB0aGUgcGF0Y2ggaXMgSU1ITyBmaW5lLiANCg0KUmVnYXJkaW5nIEFuZHJld+KAmXMgY29tbWVu
dDogdGhlIGJ5dGVzIHR5cGUgd2FzIGludHJvZHVjZWQgaW4gT0NhbWwgNC4wMiAtIHRoaXMgbWFr
ZXMgdGhlIHBhdGNoIG5vdCBjb21wYXRpYmxlIHdpdGggT0NhbWwgMy4wOS4zLiBJIHN0aWxsIHRo
aW5rIHRoYXQgdXNpbmcgdGhlIC11bnNhZmUtc3RyaW5nIG9wdGlvbiAoaW50cm9kdWNlZCBpbiBP
Q2FtbCA0LjAyKSB0byBrZWVwIHN0cmluZ3MgbXV0YWJsZSB0byBhdm9pZCBjb2RlIGNoYW5nZXMg
aXMgbm90IGdvaW5nIHRvIHdvcmsgaW4gdGhlIGxvbmcgcnVuLiBUaGUgY3VycmVudCBPQ2FtbCB2
ZXJzaW9uIGlzIDQuMDYuDQoNCuKAlCBDaHJpc3RpYW4gCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
