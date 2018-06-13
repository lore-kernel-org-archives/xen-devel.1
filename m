From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 00/11] Add support for Hygon's Dhyana Family
 18h processor
Date: Wed, 13 Jun 2018 22:51:29 +0200
Message-ID: <20180613205129.GD26375__38873.8762391315$1528923027$gmane$org@zn.tnic>
References: <1528550410-28080-1-git-send-email-puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ztm2=i7=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1fTCjx-00069W-P8
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 20:51:37 +0000
Content-Disposition: inline
In-Reply-To: <1528550410-28080-1-git-send-email-puwen@hygon.cn>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>
Cc: kvm@vger.kernel.org, rkrcmar@redhat.com, peterz@infradead.org, viresh.kumar@linaro.org, trenn@suse.com, linux-x86_64@vger.kernel.org, hpa@zytor.com, shuah@kernel.org, boris.ostrovsky@oracle.com, linux-arch@vger.kernel.org, zhangpanyong@hygon.cn, x86@kernel.org, linux-acpi@vger.kernel.org, mingo@redhat.com, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, lenb@kernel.org, thomas.lendacky@amd.com, linux-pm@vger.kernel.org, tglx@linutronix.de, mchehab@kernel.org, linux-edac@vger.kernel.org, jgross@suse.com, tony.luck@intel.com, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, pbonzini@redhat.com
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBKdW4gMDksIDIwMTggYXQgMDk6MjA6MTBQTSArMDgwMCwgUHUgV2VuIHdyb3RlOgo+
IEFzIGEgbmV3IHg4NiBDUFUgVmVuZG9yLCBDaGVuZ2R1IEhhaWd1YW5nIElDIERlc2lnbiBDby4s
IEx0ZCAoSHlnb24pCj4gaXMgYSBKb2ludCBWZW50dXJlIGJldHdlZW4gQU1EIGFuZCBIYWlndWFu
ZyBJbmZvcm1hdGlvbiBUZWNobm9sb2d5IENvLiwKPiBMdGQuLCBhbmQgYWltcyBhdCBwcm92aWRp
bmcgaGlnaCBwZXJmb3JtYW5jZSB4ODYgcHJvY2Vzc29yIGZvciBDaGluYQo+IHNlcnZlciBtYXJr
ZXQuCj4gCj4gVGhlIGZpcnN0IGdlbmVyYXRpb24gSHlnb24ncyBwcm9jZXNzb3IoRGh5YW5hKSBv
cmlnaW5hdGVzIGZyb20gQU1ECj4gdGVjaG5vbG9neSBhbmQgc2hhcmVzIG1vc3Qgb2YgdGhlIGFy
Y2hpdGVjdHVyZSB3aXRoIEFNRCdzIGZhbWlseSAxN2gsCj4gYnV0IHdpdGggZGlmZmVyZW50IENQ
VSBWZW5kb3IgSUQoIkh5Z29uR2VudWluZSIpL1BDSUUgRGV2aWNlIFZlbmRvciBJRAo+ICgweDFE
OTQpL0ZhbWlseSBzZXJpZXMgbnVtYmVyKEZhbWlseSAxOGgpLgo+IAo+IFRvIGVuYWJsZSB0aGUg
c3VwcG9ydCBvZiBMaW51eCBrZXJuZWwgdG8gSHlnb24ncyBDUFUsIHdlIGFkZGVkIGEgbmV3Cj4g
dmVuZG9yIHR5cGUgKFg4Nl9WRU5ET1JfSFlHT04sIHdpdGggdmFsdWUgb2YgOSkgaW4gYXJjaC94
ODYvaW5jbHVkZS8KPiBhc20vcHJvY2Vzc29yLmgsIGFuZCBzaGFyZWQgbW9zdCBvZiBrZXJuZWwg
c3VwcG9ydCBjb2RlcyB3aXRoIEFNRAo+IGZhbWlseSAxN2guCj4gCj4gVGhlc2UgcGF0Y2hlcyBo
YXZlIGJlZW4gYXBwbGllZCBhbmQgdGVzdGVkIHN1Y2Nlc3NmdWxseSBpbiBIeWdvbidzCj4gRGh5
YW5hIFNvQyBzaWxpY29uLiBBbHNvIHRlc3RlZCBvbiBBTUQncyBFUFlDIChGYW1pbHkgMTdoKSBw
cm9jZXNzb3IKPiB3b3JrcyBmaW5lIGFuZCBtYWtlcyBubyBoYXJtIHRvIGV4aXN0aW5nIGNvZGVz
LgoKV2VsbCwgSSBkb24ndCBsaWtlIHRoaXMgZGlmZnN0YXQ6CgogMzcgZmlsZXMgY2hhbmdlZCwg
MTgzIGluc2VydGlvbnMoKyksIDU2IGRlbGV0aW9ucygtKQoKd2hpY2ggYWRkcyBhIGxvdCBvZiBj
b2RlIGNoZWNraW5nIHRoaXMgbmV3IHZlbmRvci4gQnV0IHRoZW4gaXQgYWRkcyBpbgp0aGUgQU1E
IHBhdGhzIGFuZCBJIGRvbid0IHNlZSBpdCBiZWluZyBhbnkgZGlmZmVyZW50IGZyb20gYW4gQU1E
IENQVS4gU28KaXQgZG9lcyB0aGUgc2FtZSBhIFplbiBkb2VzIGJ1dCB0aGVuIGl0IGlzIEh5Z29u
LgoKU28gSSdkIHByZWZlciB0byAqbm90KiBzcHJpbmtsZSB0aG9zZSBYODZfVkVORE9SX0hZR09O
IGNoZWNrcyBldmVyeXdoZXJlCmJ1dCBzaW1wbHkgaGF2ZSB0aGUgdmVuZG9yIGJlIFg4Nl9WRU5E
T1JfQU1EIGFuZCBvbmx5IHRoZSB1c2VyLXZpc2libGUKcmVwb3J0aW5nIHRvIHNob3cgdGhhdCBp
dCBpcyBIeWdvbi4gQmVjYXVzZSB0byB0aGUga2VybmVsIGl0IGlzIGFuIEFNRApDUFUgLSBvbmx5
IHRoZSBzdXBlcmZpY2lhbCBhdHRyaWJ1dGVzIGFyZSBzb21ldGhpbmcgZWxzZS4gT2ggd2VsbCwg
YW5kClBDSSBkZXZpY2UgSURzIGJ1dCB0aGF0J3MgbGlrZSBhbm90aGVyIENQVSByZXZpc2lvbi4K
ClRoeC4KCi0tIApSZWdhcmRzL0dydXNzLAogICAgQm9yaXMuCgpHb29kIG1haWxpbmcgcHJhY3Rp
Y2VzIGZvciA0MDA6IGF2b2lkIHRvcC1wb3N0aW5nIGFuZCB0cmltIHRoZSByZXBseS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
