From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v7] arch/x86: Add registers to vm_event
Date: Fri, 02 Nov 2018 07:00:40 -0600
Message-ID: <5BDC4A7802000078001F7374@prv1-mh.provo.novell.com>
References: <20181102125419.26641-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wbrw=nn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gIZOH-000704-9W
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 13:21:33 +0000
In-Reply-To: <20181102125419.26641-1-aisaila@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjExLjE4IGF0IDEzOjU0LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IEBAIC0xOTEsOSArMTk3LDI2IEBAIHN0cnVjdCB2bV9ldmVudF9yZWdzX3g4NiB7Cj4gICAg
ICB1aW50NjRfdCBtc3JfZWZlcjsKPiAgICAgIHVpbnQ2NF90IG1zcl9zdGFyOwo+ICAgICAgdWlu
dDY0X3QgbXNyX2xzdGFyOwo+ICsgICAgdWludDMyX3QgY3NfYmFzZTsKPiArICAgIHVpbnQzMl90
IHNzX2Jhc2U7Cj4gKyAgICB1aW50MzJfdCBkc19iYXNlOwo+ICsgICAgdWludDMyX3QgZXNfYmFz
ZTsKPiAgICAgIHVpbnQ2NF90IGZzX2Jhc2U7Cj4gICAgICB1aW50NjRfdCBnc19iYXNlOwo+IC0g
ICAgdWludDMyX3QgY3NfYXJieXRlczsKPiArICAgIHN0cnVjdCB2bV9ldmVudF94ODZfc2VsZWN0
b3JfcmVnIGNzOwo+ICsgICAgc3RydWN0IHZtX2V2ZW50X3g4Nl9zZWxlY3Rvcl9yZWcgc3M7Cj4g
KyAgICBzdHJ1Y3Qgdm1fZXZlbnRfeDg2X3NlbGVjdG9yX3JlZyBkczsKPiArICAgIHN0cnVjdCB2
bV9ldmVudF94ODZfc2VsZWN0b3JfcmVnIGVzOwo+ICsgICAgc3RydWN0IHZtX2V2ZW50X3g4Nl9z
ZWxlY3Rvcl9yZWcgZnM7Cj4gKyAgICBzdHJ1Y3Qgdm1fZXZlbnRfeDg2X3NlbGVjdG9yX3JlZyBn
czsKPiArICAgIHVpbnQ2NF90IHNoYWRvd19nczsKPiArICAgIHVpbnQ2NF90IGRyNjsKPiArICAg
IHVpbnQxNl90IGNzX3NlbDsKPiArICAgIHVpbnQxNl90IHNzX3NlbDsKPiArICAgIHVpbnQxNl90
IGRzX3NlbDsKPiArICAgIHVpbnQxNl90IGVzX3NlbDsKPiArICAgIHVpbnQxNl90IGZzX3NlbDsK
PiArICAgIHVpbnQxNl90IGdzX3NlbDsKPiAgICAgIHVpbnQzMl90IF9wYWQ7Cj4gIH07CgpEbyB3
ZSByZWFsbHkgbmVlZCBkcjYgYmUgNjQgYml0cyB3aWRlPyBFbHNlIHRoZSBwYWRkaW5nIGZpZWxk
CmNvdWxkIGJlIHJldXNlZC4gSW4gYW55IGV2ZW50IEknbSBub3Qgb3Zlcmx5IGhhcHB5IHRvIHNl
ZSBpdApnbyBpbiB0aGUgbWlkZGxlIG9mIHRoZSBzZWdtZW50IHJlZ2lzdGVyIHN0dWZmLgoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
