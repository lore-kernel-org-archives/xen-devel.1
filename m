From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] xen: introduce a cpumask with all bits
 set
Date: Thu, 14 Mar 2019 10:04:36 +0000
Message-ID: <37e7beea-3bfe-4695-7ced-3ee1690d1af7@citrix.com>
References: <20190314095953.11752-1-jgross@suse.com>
 <20190314095953.11752-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rzje=RR=citrix.com=prvs=969ff7116=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h4NEM-0001V9-MC
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 10:04:54 +0000
In-Reply-To: <20190314095953.11752-2-jgross@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMjAxOSAwOTo1OSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBUaGVyZSBhcmUgc2V2
ZXJhbCBwbGFjZXMgaW4gWGVuIGFsbG9jYXRpbmcgYSBjcHVtYXNrIG9uIHRoZSBzdGFjayBhbmQK
PiBzZXR0aW5nIGFsbCBiaXRzIGluIGl0IGp1c3QgdG8gdXNlIGl0IGFzIGFuIGluaXRpYWwgbWFz
ayBmb3IgYWxsb3dpbmcKPiBhbGwgY3B1cy4KPgo+IFNhdmUgdGhlIHN0YWNrIHNwYWNlIGFuZCBv
bWl0IHRoZSBuZWVkIGZvciBydW50aW1lIGluaXRpYWxpemF0aW9uIGJ5Cj4gZGVmaW5pbmcgYSBn
bG9iYWxseSBhY2Nlc3NpYmxlIGNwdW1hc2tfYWxsIHZhcmlhYmxlLgo+Cj4gU2lnbmVkLW9mZi1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+LCB3aXRoIG9uZSBtaW5vcgpzdHlsZSBz
dWdnZXN0aW9ucyB3aGljaCBjYW4gYmUgZm9sZGVkIG9uIGNvbW1pdC4KCj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9pb19hcGljLmMgYi94ZW4vYXJjaC94ODYvaW9fYXBpYy5jCj4gaW5kZXgg
ZGFhNWU5ZTVmZi4uYTUzNDRlZDcyNyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvaW9fYXBp
Yy5jCj4gKysrIGIveGVuL2FyY2gveDg2L2lvX2FwaWMuYwo+IEBAIC0xODkyLDggKzE4OTEsNyBA
QCBzdGF0aWMgdm9pZCBfX2luaXQgY2hlY2tfdGltZXIodm9pZCkKPiAgICAgIHZlY3RvciA9IElS
UTBfVkVDVE9SOwo+ICAgICAgY2xlYXJfaXJxX3ZlY3RvcigwKTsKPiAgCj4gLSAgICBjcHVtYXNr
X3NldGFsbCgmbWFza19hbGwpOwo+IC0gICAgaWYgKChyZXQgPSBiaW5kX2lycV92ZWN0b3IoMCwg
dmVjdG9yLCAmbWFza19hbGwpKSkKPiArICAgIGlmICgocmV0ID0gYmluZF9pcnFfdmVjdG9yKDAs
IHZlY3RvciwgJmNwdW1hc2tfYWxsKSkpCgpTcGFjZXMsIHNlZWluZyBhcyB3ZSdyZSBtb2RpZnlp
bmcgdGhlIGxpbmUuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
