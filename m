From: Juergen Gross <jgross@suse.com>
Subject: Re: arm: xl vcpu-pin leads to oom-killer slashing
 processes
Date: Thu, 13 Dec 2018 17:37:45 +0100
Message-ID: <123d71d1-4a64-3f27-ddb5-3d8ce06f1734@suse.com>
References: <2c2385f9-515d-1c13-2618-d22d52901abc@gmail.com>
 <cfad156f-19ef-5e87-7af0-3dbbf361dc8a@arm.com>
 <9f2f6edf-c96d-fda9-851b-a2bae8fb25ec@gmail.com>
 <6bc804b4-df7a-08fd-9bf0-7384015a2b74@arm.com>
 <5f581369-55ad-345f-7837-48265fcd805a@gmail.com>
 <ee45a5c4-5097-a0e6-8099-f0a998cc3c88@arm.com>
 <52353b63-5434-4b33-5ee7-e3a559563c6a@gmail.com>
 <69b378ad-3710-afe9-25a0-8825caf848a7@arm.com>
 <973a7ae9-2c78-690d-cf70-913a99767720@gmail.com>
 <adf4af85-e232-b958-6b12-20e1d30721bb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JAiy=OW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gXTzk-0003Bx-8a
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 16:37:52 +0000
In-Reply-To: <adf4af85-e232-b958-6b12-20e1d30721bb@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTMvMTggMzoxMyBQTSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBIZWxsbyBBbGwsCj4g
Cj4gT0ssIEkndmUgZGlzY292ZXJlZCBhIG1lY2hhbmlzbSBvZiB0aGUgaXNzdWUuCj4gSXQgaXPC
oCBiZWNhdXNlIG9mIGBkLT5tYXhfcGFnZXMgPSB+MFU7YCBpbiBhIGBjb25zdHJ1Y3RfZG9tMCgp
YC4KPiBXaGVuIEkgZG8gdmNwdS1waW4sIGxpYnhsIHVwZGF0ZXMgbWVtb3J5IG5vZGVzIGluIHhl
bnN0b3JlIGZvciBEb20wLiAKPiBUaGVuIGtlcm5lbCB3YXRjaCBzZWVzIHRob3NlIGNoYW5nZXMg
YW5kIHRyeWluZyB0byBzZXQgbmV3IHRhcmdldCBmb3IgCj4gYmFsbG9uLCBidXQgdGhlIHRhcmdl
dCBiZWNvbWVzIGV4dHJlbWVseSBoaWdoLCBhbmQgYmFsb29uIHN1Y2tzIGFsbCB0aGUgCj4gcGFn
ZXMuCj4gCj4gSW4gbXkga2VybmVsICg0LjE0KSBpbiBgd2F0Y2hfdGFyZ2V0KClgIGZ1bmN0aW9u
IHRoZXJlIGlzIGEgY29kZToKPiAKPiAgwqDCoMKgwqDCoMKgwqAgdGFyZ2V0X2RpZmYgPSB4ZW5f
cHZfZG9tYWluKCkgPyAwCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6IHN0YXRp
Y19tYXggLSBiYWxsb29uX3N0YXRzLnRhcmdldF9wYWdlczsKPiAKPiBIZXJlIHdlIGhhdmUgYHhl
bl9wdl9kb21haW4oKWAgZXF1YWwgdG8gemVybywgc28gYHRhcmdldF9kaWZmYCBiaWcuIAo+IFRo
ZW4sIGZldyBsaW5lcyBiZWxvdzoKPiAKPiAgwqDCoMKgwqBiYWxsb29uX3NldF9uZXdfdGFyZ2V0
KG5ld190YXJnZXQgLSB0YXJnZXRfZGlmZik7Cj4gCj4gYGJhbGxvb25fc2V0X25ld190YXJnZXQo
KWAgcmVjZWl2ZXMgYSB2YWx1ZSB3cmFwcGVkIG92ZXIgNjRiaXQgd2hhdCAKPiBraWxscyB0aGUg
c3lzdGVtLgo+IAo+IE5vdyBJJ20gbG9va2luZyBmb3IgYW4gYXBwcm9wcmlhdGUga2VybmVsIHBh
dGNoIGZvciB0aGUga2VybmVsLCB0byBmaXggCj4gdGhhdC4gQW55IHN1Z2dlc3Rpb25zPwo+IAoK
WW91IHNob3VsZCB1c2UgbGludXgga2VybmVsIGNvbW1pdCAzNTk2OTI0YTIzM2U0NWFhOTE4LgoK
Ckp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
