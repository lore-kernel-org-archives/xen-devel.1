From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/hvm: Unify hvm_event_pending()'s API
 with the !CONFIG_HVM version
Date: Fri, 9 Nov 2018 09:57:32 -0500
Message-ID: <97981da5-6816-0bd4-1caa-2e8c08a7e045@oracle.com>
References: <1541774547-31337-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1541774547-31337-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvOS8xOCA5OjQyIEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE5vIGZ1bmN0aW9uYWwg
Y2hhbmdlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KPiAtLS0KPiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgo+
IENDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IENDOiBKdW4gTmFrYWppbWEgPGp1
bi5uYWthamltYUBpbnRlbC5jb20+Cj4gQ0M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwu
Y29tPgo+IENDOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+
IENDOiBTdXJhdmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29t
Pgo+IENDOiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4KPiAtLS0KCgpSZXZpZXdl
ZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
