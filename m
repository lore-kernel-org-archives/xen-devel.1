From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/x86: Implement enable_nmis() in C
Date: Thu, 15 Mar 2018 11:02:40 -0600
Message-ID: <5AAAB54002000078001B25B5@prv-mh.provo.novell.com>
References: <1521132237-31913-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1521132237-31913-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAzLjE4IGF0IDE3OjQzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBlbmFibGVfbm1pcyh2b2lkKQo+ICt7Cj4gKyAgICB1
bnNpZ25lZCBsb25nIHRtcDsKPiArCj4gKyAgICBhc20gdm9sYXRpbGUgKCAibW92ICUlcnNwLCAl
W3NwXSAgICAgXG5cdCIKPiArICAgICAgICAgICAgICAgICAgICJwdXNoICVbc3NdICAgICAgICAg
ICBcblx0Igo+ICsgICAgICAgICAgICAgICAgICAgInB1c2ggJVtzcF0gICAgICAgICAgIFxuXHQi
Cj4gKyAgICAgICAgICAgICAgICAgICAicHVzaGYgICAgICAgICAgICAgICAgXG5cdCIKPiArICAg
ICAgICAgICAgICAgICAgICJwdXNoICVbY3NdICAgICAgICAgICBcblx0Igo+ICsgICAgICAgICAg
ICAgICAgICAgImxlYSAxZiglJXJpcCksICVbaXBdIFxuXHQiCj4gKyAgICAgICAgICAgICAgICAg
ICAicHVzaCAlW2lwXSAgICAgICAgICAgXG5cdCIKPiArICAgICAgICAgICAgICAgICAgICJpcmV0
cTsgMTogICAgICAgICAgICBcblx0Igo+ICsgICAgICAgICAgICAgICAgICAgOiBbc3BdICI9ciIg
KHRtcCksIFtpcF0gIj1yIiAodG1wKQoKU3RyaWN0bHkgc3BlYWtpbmcgdGhpcyBuZWVkcyB0byBi
ZSAiPSZyIiBpbiBib3RoIGNhc2VzLiBUaGF0J2xsCmd1YXJhbnRlZSB0aGUgY29tcGlsZXIgdG8g
cGljayB0d28gZGlzdGluY3QgcmVnaXN0ZXJzIChub3Qgc3VyZQpob3cgdGhhdCBlbmRzIHVwIGJl
aW5nIHdpdGggdGhlIGNvZGUgeW91IGhhdmUpLCB3aGljaCBpcwptb3JlIHRoYW4gd2UgbmVlZCB3
YW50LiBIb3cgYWJvdXQgaGF2aW5nIGp1c3QgYSBzaW5nbGUKW3RtcF0gb3V0cHV0PwoKV2l0aCBh
dCBsZWFzdCB0aGUgbWlzc2luZyAmIGFkZGVkClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
