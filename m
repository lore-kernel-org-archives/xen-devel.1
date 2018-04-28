From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] [v3] x86: Convert x86_platform_ops to
 timespec64
Date: Sat, 28 Apr 2018 12:09:47 +0200
Message-ID: <CAK8P3a0T8RkPgHm6F+Y+RHBdi7v5ho1hQ8w+MwWFcOk5TbMaCw__43481.5125576735$1524910112$gmane$org@mail.gmail.com>
References: <20180427201435.3194219-1-arnd@arndb.de>
 <b8d3167b-ee9f-f14d-e43e-73aa2719d6ae@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4ndm=hr=gmail.com=arndbergmann@srs-us1.protection.inumbo.net>)
 id 1fCMne-0002EX-Oc
 for xen-devel@lists.xenproject.org; Sat, 28 Apr 2018 10:09:50 +0000
Received: by mail-qt0-x241.google.com with SMTP id g13-v6so5506915qth.8
 for <xen-devel@lists.xenproject.org>; Sat, 28 Apr 2018 03:09:49 -0700 (PDT)
In-Reply-To: <b8d3167b-ee9f-f14d-e43e-73aa2719d6ae@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, jailhouse-dev@googlegroups.com, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, kvm@vger.kernel.org, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, y2038 Mailman List <y2038@lists.linaro.org>, Jan Kiszka <jan.kiszka@siemens.com>, the arch/x86 maintainers <x86@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, John Stultz <john.stultz@linaro.org>, Borislav Petkov <bp@suse.de>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBBcHIgMjgsIDIwMTggYXQgMTI6MjEgQU0sIEpvYW8gTWFydGlucwo8am9hby5tLm1h
cnRpbnNAb3JhY2xlLmNvbT4gd3JvdGU6Cj4gT24gMDQvMjcvMjAxOCAwOToxMyBQTSwgQXJuZCBC
ZXJnbWFubiB3cm90ZToKPj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9wdmNsb2NrLmMg
Yi9hcmNoL3g4Ni9rZXJuZWwvcHZjbG9jay5jCj4+IGluZGV4IDc2MWY2YWY2ZWZhNS4uNjM3OTgy
ZWZlY2Q4IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3g4Ni9rZXJuZWwvcHZjbG9jay5jCj4+ICsrKyBi
L2FyY2gveDg2L2tlcm5lbC9wdmNsb2NrLmMKPj4gQEAgLTEyMywyOCArMTIzLDM1IEBAIHU2NCBw
dmNsb2NrX2Nsb2Nrc291cmNlX3JlYWQoc3RydWN0IHB2Y2xvY2tfdmNwdV90aW1lX2luZm8gKnNy
YykKPj4KPj4gIHZvaWQgcHZjbG9ja19yZWFkX3dhbGxjbG9jayhzdHJ1Y3QgcHZjbG9ja193YWxs
X2Nsb2NrICp3YWxsX2Nsb2NrLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBw
dmNsb2NrX3ZjcHVfdGltZV9pbmZvICp2Y3B1X3RpbWUsCj4+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgc3RydWN0IHRpbWVzcGVjICp0cykKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgdGltZXNwZWM2NCAqdHMpCj4+ICB7Cj4+ICAgICAgIHUzMiB2ZXJzaW9uOwo+PiAgICAg
ICB1NjQgZGVsdGE7Cj4+IC0gICAgIHN0cnVjdCB0aW1lc3BlYyBub3c7Cj4+ICsgICAgIHN0cnVj
dCB0aW1lc3BlYzY0IG5vdzsKPj4KPj4gICAgICAgLyogZ2V0IHdhbGxjbG9jayBhdCBzeXN0ZW0g
Ym9vdCAqLwo+PiAgICAgICBkbyB7Cj4+ICAgICAgICAgICAgICAgdmVyc2lvbiA9IHdhbGxfY2xv
Y2stPnZlcnNpb247Cj4+ICAgICAgICAgICAgICAgcm1iKCk7ICAgICAgICAgIC8qIGZldGNoIHZl
cnNpb24gYmVmb3JlIHRpbWUgKi8KPj4gKyAgICAgICAgICAgICAvKgo+PiArICAgICAgICAgICAg
ICAqIE5vdGU6IHdhbGxfY2xvY2stPnNlYyBpcyBhIHUzMiB2YWx1ZSwgc28gaXQgY2FuCj4+ICsg
ICAgICAgICAgICAgICogb25seSBzdG9yZSBkYXRlcyBiZXR3ZWVuIDE5NzAgYW5kIDIxMDYuIFRv
IGFsbG93Cj4+ICsgICAgICAgICAgICAgICogdGltZXMgYmV5b25kIHRoYXQsIHdlIG5lZWQgdG8g
Y3JlYXRlIGEgbmV3IGh5cGVyY2FsbAo+PiArICAgICAgICAgICAgICAqIGludGVyZmFjZSB3aXRo
IGFuIGV4dGVuZGVkIHB2Y2xvY2tfd2FsbF9jbG9jayBzdHJ1Y3R1cmUKPj4gKyAgICAgICAgICAg
ICAgKiBsaWtlIEFSTSBoYXMuCj4+ICsgICAgICAgICAgICAgICovCj4+ICAgICAgICAgICAgICAg
bm93LnR2X3NlYyAgPSB3YWxsX2Nsb2NrLT5zZWM7Cj4KPiBJSVVDIHRoZSBpbnRlcmZhY2UgeW91
J3JlIHByb2JhYmx5IHNwZWFraW5nIGFib3V0IGlzIGNvbW1vbiB0byBib3RoIEFSTSBhbmQgeDg2
Cj4gb24gWGVuWypdIChzaW5jZSBYZW4gNC42KSBpLmUuCj4KPiAgICAgICAgIG5vdy50dl9zZWMg
ID0gKCh1aW50NjRfdClzLT53Y19zZWNfaGkgPDwgMzIpIHwgcy0+d2Nfc2VjOwo+Cj4gcyByZXBy
ZXNlbnRpbmcgc3RydWN0IHNoYXJlZF9pbmZvIGxpa2Ugb24gQVJNICh0aGVyZSdzIGEgMzItYml0
IGhvbGUgd2hlcmUKPiB3Y19zZWNfaGkgaXMgcGxhY2VkIG9uIHg4Nl82NC9BUk0pLiBFeGNlcHQg
b24geDg2IDMyLWJpdCBndWVzdHMgd2Nfc2VjX2hpIGlzCj4gbG9jYXRlZCBlbHNld2hlcmUuCj4K
PiAgICAgICAgIEpvYW8KPgo+IFsqXQo+IGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2RvY3MvNC42
LXRlc3RpbmcvaHlwZXJjYWxsL3g4Nl82NC9pbmNsdWRlLHB1YmxpYyx4ZW4uaC5odG1sI2luY29u
dGVudHNfc3RhcnRvZmRheV9zaGFyZWQKCkFoLCBnb29kLiBIb3cgcG9ydGFibGUgaXMgdGhhdD8g
V2lsbCBpdCBkbyB0aGUgcmlnaHQgdGhpbmcgKGkuZS4KZ3VhcmFudGVlIHRvIGhhdmUKemVyb2Vz
IG9uIHRoZSB1cHBlciBoYWxmLCBvciB0aGUgZXBvY2ggaWYgc3VwcG9ydGVkKSBvbiBhbGwgdmVy
c2lvbnMgb2YgYm90aCBLVk0KYW5kIFhlbiwgb3IgZG8gd2UgbmVlZCBhbiBhZGRpdGlvbmFsIGNo
ZWNrIGluIHRoZXJlPwoKSSdkIHN1Z2dlc3QgbGVhdmluZyB0aGUgaW1wbGVtZW50YXRpb24gb2Yg
dGhhdCB0byBhIGZvbGxvdy11cCBwYXRjaCB0aGF0IHlvdQpjYW4gYWRkIG9uY2UgbXkgcGF0Y2gg
aXMgbWVyZ2VkLgoKICAgICAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
