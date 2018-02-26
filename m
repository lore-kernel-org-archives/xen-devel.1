From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [RFC PATCH 0/5] x86: Multiple fixes to MSR_TSC_AUX
 and RDTSCP handling for guests
Date: Mon, 26 Feb 2018 14:44:24 -0500
Message-ID: <fa752277-f9d1-610c-dbdf-4d9d1ab6a96a@oracle.com>
References: <1519127923-23539-1-git-send-email-andrew.cooper3@citrix.com>
 <3932aaca-1d30-85f9-b27a-c717997794fa@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <3932aaca-1d30-85f9-b27a-c717997794fa@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjYvMjAxOCAwMjoxMiBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMC8wMi8x
OCAxMTo1OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gVGhpcyByYXRzIG5lc3Qgd2FzIGRpc2Nv
dmVyZWQgd2hlbiBmaW5kaW5nIHRoYXQgTVNSX1RTQ19BVVggbGVha2VkIGludG8gUFYKPj4gZ3Vl
c3RzLiAgSXQgaXMgUkZDIGJlY2F1c2UgSSBoYXZlbid0IGRvbmUgZXh0ZW5zaXZlIHRlc3Rpbmcg
b24gdGhlIHJlc3VsdCwgYW5kCj4+IGJlY2F1c2UgdGhlcmUgYXJlIHNvbWUgZnVuY3Rpb25hbCBj
aGFuZ2VzIGZvciB0aGUgdmlydHVhbGlzZWQgVFNDIG1vZGVzLgo+Pgo+PiBBbmRyZXcgQ29vcGVy
ICg1KToKPj4gICB4ODYvaHZtOiBEb24ndCBzaGFkb3cgdGhlIGRvbWFpbiBwYXJhbWV0ZXIgaW4g
aHZtX3NhdmVfY3B1X21zcnMoKQo+PiAgIHg4Ni9wdjogQXZvaWQgbGVha2luZyBvdGhlciBndWVz
dHMnIE1TUl9UU0NfQVVYIHZhbHVlcyBpbnRvIFBWIGNvbnRleHQKPj4gICB4ODYvdGltZTogUmV3
b3JrIHB2X3NvZnRfcmR0c2MoKSB0byBhaWQgZnVydGhlciBjbGVhbnVwCj4+ICAgeDg2L3B2OiBS
ZW1vdmUgZGVmZXJyZWQgUkRUU0N7LFB9IGhhbmRsaW5nIGluIHB2X2VtdWxhdGVfcHJpdmlsZWdl
ZF9vcCgpCj4+ICAgeDg2OiBSZXdvcmsgTVNSX1RTQ19BVVggaGFuZGxpbmcgZnJvbSBzY3JhdGNo
Lgo+IEtvbnJhZC9Cb3JpczogQ2FuIHdlIGhhdmUgYW55IGlucHV0IFdSVCBUU0NfTU9ERV9QVlJE
VFNDUCB1c2FnZT8gIEFyZQo+IHlvdSBzdGlsbCB1c2luZyB0aGUgZmVhdHVyZSwgb3IgaXMgaXQg
YWJhbmRvbmVkPwoKCkkgYWxyZWFkeSBhc2tlZCBhIGZldyBpbnRlcm5hbCB0ZWFtcyBhYm91dCwg
aGF2ZW4ndCBoZWFyZCBiYWNrLgoKLWJvcmlzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
