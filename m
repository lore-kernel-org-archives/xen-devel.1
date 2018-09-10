From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3] xen/balloon: add runtime control for
 scrubbing ballooned out pages
Date: Mon, 10 Sep 2018 13:31:30 +0200
Message-ID: <36fd02b9-ba23-ddb6-787e-8dd30fca1319__2911.20021506703$1536579016$gmane$org@suse.com>
References: <5B92A01D02000078001E67CE@prv1-mh.provo.novell.com>
 <20180907164912.21075-1-marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mvod=ly=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fzKPn-0004Sy-Uy
 for xen-devel@lists.xenproject.org; Mon, 10 Sep 2018 11:31:35 +0000
In-Reply-To: <20180907164912.21075-1-marmarek@invisiblethingslab.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: David Rientjes <rientjes@google.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frederic Weisbecker <frederic@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Kai-Heng Feng <kai.heng.feng@canonical.com>, Thomas Gleixner <tglx@linutronix.de>, Jiri Kosina <jkosina@suse.cz>, Bjorn Helgaas <bhelgaas@google.com>, Thymo van Beers <thymovanbeers@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ingo Molnar <mingo@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDkvMTggMTg6NDksIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToKPiBT
Y3J1YmJpbmcgcGFnZXMgb24gaW5pdGlhbCBiYWxsb29uIGRvd24gY2FuIHRha2Ugc29tZSB0aW1l
LCBlc3BlY2lhbGx5Cj4gaW4gbmVzdGVkIHZpcnR1YWxpemF0aW9uIGNhc2UgKG5lc3RlZCBFUFQg
aXMgc2xvdykuIFdoZW4gSFZNL1BWSCBndWVzdCBpcwo+IHN0YXJ0ZWQgd2l0aCBtZW1vcnk9IHNp
Z25pZmljYW50bHkgbG93ZXIgdGhhbiBtYXhtZW09LCBhbGwgdGhlIGV4dHJhCj4gcGFnZXMgd2ls
bCBiZSBzY3J1YmJlZCBiZWZvcmUgcmV0dXJuaW5nIHRvIFhlbi4gQnV0IHNpbmNlIG1vc3Qgb2Yg
dGhlbQo+IHdlcmVuJ3QgdXNlZCBhdCBhbGwgYXQgdGhhdCBwb2ludCwgWGVuIG5lZWRzIHRvIHBv
cHVsYXRlIHRoZW0gZmlyc3QKPiAoZnJvbSBwb3B1bGF0ZS1vbi1kZW1hbmQgcG9vbCkuIEluIG5l
c3RlZCB2aXJ0IGNhc2UgKFhlbiBpbnNpZGUgS1ZNKQo+IHRoaXMgc2xvd3MgZG93biB0aGUgZ3Vl
c3QgYm9vdCBieSAxNS0zMHMgd2l0aCBqdXN0IDEuNUdCIG5lZWRlZCB0byBiZQo+IHJldHVybmVk
IHRvIFhlbi4KPiAKPiBBZGQgcnVudGltZSBwYXJhbWV0ZXIgdG8gZW5hYmxlL2Rpc2FibGUgaXQs
IHRvIGFsbG93IGluaXRpYWxseSBkaXNhYmxpbmcKPiBzY3J1YmJpbmcsIHRoZW4gZW5hYmxlIGl0
IGJhY2sgZHVyaW5nIGJvb3QgKGZvciBleGFtcGxlIGluIGluaXRyYW1mcykuCj4gU3VjaCB1c2Fn
ZSByZWxpZXMgb24gYXNzdW1wdGlvbiB0aGF0IGEpIG1vc3QgcGFnZXMgYmFsbG9vbmVkIG91dCBk
dXJpbmcKPiBpbml0aWFsIGJvb3Qgd2VyZW4ndCB1c2VkIGF0IGFsbCwgYW5kIGIpIGV2ZW4gaWYg
dGhleSB3ZXJlLCB2ZXJ5IGZldwo+IHNlY3JldHMgYXJlIGluIHRoZSBndWVzdCBhdCB0aGF0IHRp
bWUgKGJlZm9yZSBhbnkgc2VyaW91cyB1c2Vyc3BhY2UKPiBraWNrcyBpbikuCj4gQ29udmVydCBD
T05GSUdfWEVOX1NDUlVCX1BBR0VTIHRvIENPTkZJR19YRU5fU0NSVUJfUEFHRVNfREVGQVVMVCAo
YWxzbwo+IGVuYWJsZWQgYnkgZGVmYXVsdCksIGNvbnRyb2xsaW5nIGRlZmF1bHQgdmFsdWUgZm9y
IHRoZSBuZXcgcnVudGltZQo+IHN3aXRjaC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJj
enlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+CgpSZXZp
ZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
