From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/AMD: write PAT after ucode update
Date: Thu, 20 Sep 2018 14:38:01 +0100
Message-ID: <59e61af7-ae7f-db52-4b74-a4173cdbcaa7@citrix.com>
References: <5BA35D0C02000078001EA2DC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y5lu=mc=citrix.com=prvs=794f34a96=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g2z9k-0007NT-54
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 13:38:08 +0000
In-Reply-To: <5BA35D0C02000078001EA2DC@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDkvMTggMDk6NDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoZSBpbmNyZWFzZWQgbnVt
YmVyIG9mIG1lc3NhZ2VzIChzcGVjX2N0cmwuYzpwcmludF9kZXRhaWxzKCkpIHdpdGhpbiBhCj4g
Y2VydGFpbiB0aW1lIHdpbmRvdyBtYWRlIG1lIG5vdGljZSBzb21lIHNsb3duZXNzIG9mIGJvb3Qg
dGltZSBzY3JlZW4KPiBvdXRwdXQuIEV4cGVyaW1lbnRhbGx5IEkndmUgbmFycm93ZWQgdGhlIHRp
bWUgd2luZG93IHRvIGJlIGZyb20KPiBpbW1lZGlhdGVseSBhZnRlciB0aGUgZWFybHkgdWNvZGUg
dXBkYXRlIG9uIHRoZSBCU1AgdG8gdGhlIFBBVCB3cml0ZSBpbgo+IGNwdV9pbml0KCkuIEZvciB0
aGF0IHJlYXNvbiwgYXMgYSB3b3JrYXJvdW5kLCB3cml0ZSBQQVQgd2l0aCBpdHMKPiBkZXNpZ25h
dGVkIHZhbHVlIGltbWVkaWF0ZWx5IGFmdGVyIHRoZSB1Y29kZSBsb2FkLgo+Cj4gU2ltaWxhciBz
bG93bmVzcyBjYW5ub3QgYmUgb2JzZXJ2ZWQgb24gQVBzLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKRnJvbSBhIHN0cmFpZ2h0IHg4NiBzaWRlIG9m
IHRoaW5ncywgQWNrZWQtYnk6IEFuZHJldyBDb29wZXIKPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+IGJ1dCBJJ2Qgc3RpbGwgbGlrZSB0byBnZXQgc29tZSBmZWVkYmFjayBmcm9tCkFNRC4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
