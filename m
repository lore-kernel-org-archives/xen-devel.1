From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 01/17] x86/cpu: create Dhyana init file
 and register new cpu_dev to system
Date: Tue, 24 Jul 2018 20:14:29 +0200
Message-ID: <ed090643-09da-cde7-6edd-970d973afd4d__44185.644030995$1532456009$gmane$org@redhat.com>
References: <1532352037-7151-1-git-send-email-puwen@hygon.cn>
 <1532352037-7151-2-git-send-email-puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+4pg=ki=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1fi1pX-0005w9-II
 for xen-devel@lists.xenproject.org; Tue, 24 Jul 2018 18:14:39 +0000
In-Reply-To: <1532352037-7151-2-git-send-email-puwen@hygon.cn>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>, tglx@linutronix.de, bp@alien8.de, thomas.lendacky@amd.com, mingo@redhat.com, hpa@zytor.com, peterz@infradead.org, tony.luck@intel.com, rkrcmar@redhat.com, boris.ostrovsky@oracle.com, jgross@suse.com, rjw@rjwysocki.net, lenb@kernel.org, viresh.kumar@linaro.org, mchehab@kernel.org, trenn@suse.com, shuah@kernel.org, JBeulich@suse.com, x86@kernel.org
Cc: linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDcvMjAxOCAxNToyMCwgUHUgV2VuIHdyb3RlOgo+IEFkZCB4ODYgYXJjaGl0ZWN0dXJl
IHN1cHBvcnQgZm9yIG5ldyBwcm9jZXNzb3IgSHlnb24gRGh5YW5hIEZhbWlseSAxOGguCj4gUmV3
b3JrIHRvIGNyZWF0ZSBhIHNlcGFyYXRlZCBmaWxlKGFyY2gveDg2L2tlcm5lbC9jcHUvaHlnb24u
YykgZnJvbSB0aGUKPiBBTUQgaW5pdCBvbmUoYXJjaC94ODYva2VybmVsL2NwdS9hbWQuYykgdG8g
aW5pdGlhbGl6ZSBEaHlhbmEgQ1BVLiBJbgo+IHRoaXMgd2F5IHdlIGNhbiByZW1vdmUgb2xkIEFN
RCBhcmNoaXRlY3R1cmUgc3VwcG9ydCBjb2RlcyBmcm9tIEh5Z29uCj4gY29kZSBwYXRoIGFuZCBn
ZW5lcmF0ZSBhIGNsZWFyIGluaXRpYWxpemF0aW9uIGZsb3cgZm9yIEh5Z29uIHByb2Nlc3NvcnMs
Cj4gaXQgYWxzbyByZWR1Y2UgbG9uZy10ZXJtIG1haW50ZW5hbmNlIGVmZm9ydC4KPiBBbHNvIGFk
ZCBoeWdvbi5jIE1haW50YWluZXIgaW5mb3JtYXRpb24gaW4gYWNjb3JkYW5jZS4KPiAKPiBUbyBp
ZGVudGlmeSBIeWdvbiBwcm9jZXNzb3JzLCBhZGQgYSBuZXcgdmVuZG9yIHR5cGUgWDg2X1ZFTkRP
Ul9IWUdPTig5KQo+IGZvciBzeXN0ZW0gcmVjb2duaXRpb24uCj4gCj4gVG8gZW5hYmxlIEh5Z29u
IHByb2Nlc3NvciBjb25maWcsIGFkZCBhIHNlcGFyYXRlZCBLY29uZmlnIGVudHJ5KENQVV9TVVBf
Cj4gSFlHT04pIGZvciBEaHlhbmEgQ1BVIGluIGtlcm5lbCBjb25maWcgc2V0dXAuCgpJZiBIeWdv
biBwcm9jZXNzb3JzIGFyZSBjdXJyZW50bHkgdGhlIHNhbWUgYXMgQU1ELCBJIGRvbid0IHNlZSB0
aGUgcG9pbnQKaW4gY3JlYXRpbmcgYSBuZXcgZmlsZSBqdXN0IGZvciB0aGVtLiAgTGlrZXdpc2Ug
Zm9yIGV4YW1wbGUgaW4gcGF0Y2ggNgoKCisJY2FzZSBYODZfVkVORE9SX0hZR09OOgorCQlpZGVh
bF9ub3BzID0gcDZfbm9wczsKKwkJcmV0dXJuOworCiAJY2FzZSBYODZfVkVORE9SX0FNRDoKIAkJ
aWYgKGJvb3RfY3B1X2RhdGEueDg2ID4gMHhmKSB7CiAJCQlpZGVhbF9ub3BzID0gcDZfbm9wczsK
ClNob3VsZCBvbmx5IG5lZWQgdG8gYWRkICJjYXNlIFg4Nl9WRU5ET1JfSFlHT046Ii4gIE9yIHlv
dSBjb3VsZCBldmVuCnJldXNlIFg4Nl9WRU5ET1JfQU1ELgoKUGFvbG8KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
