From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v2] x86/vm_event: add gdtr_base to the
 vm_event structure
Date: Fri, 3 May 2019 01:10:15 +0300
Message-ID: <e2ead423-6daa-a52e-9d3e-899e686ed043@bitdefender.com>
References: <20190502214203.17279-1-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L2Tp=TC=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hMJuS-0006Jp-Jd
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 22:10:32 +0000
In-Reply-To: <20190502214203.17279-1-tamas@tklengyel.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS8zLzE5IDEyOjQyIEFNLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gUmVjZWl2aW5nIHRo
aXMgcmVnaXN0ZXIgaXMgdXNlZnVsIGZvciBpbnRyb3NwZWN0aW5nIDMyLWJpdCBXaW5kb3dzIHdo
ZW4gdGhlCj4gZXZlbnQgYmVpbmcgdHJhcHBlZCBoYXBwZW5lZCB3aGlsZSBpbiByaW5nMy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4g
Q2M6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KPiBDYzogVGFt
YXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgo+IENjOiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Cj4gQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gQ2M6IFJvZ2VyIFBh
dSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gLS0tCj4gdjI6IGFkZCBnZHRyIGxpbWl0
CgpBY2tlZC1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgoK
ClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
