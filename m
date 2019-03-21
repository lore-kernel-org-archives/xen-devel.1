From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH for-4.12] passthrough/vtd: Drop the
 "workaround_bios_bug" logic entirely
Date: Thu, 21 Mar 2019 20:47:55 +0000
Message-ID: <899ddd63-4303-c8d8-0764-55762e73c2fd@citrix.com>
References: <1553199980-9849-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1553199980-9849-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjEvMDMvMjAxOSAyMDoyNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBJdCB0dXJucyBvdXQg
dGhhdCB0aGlzIGNvZGUgd2FzIHByZXZpb3VzbHkgZGVhZC4KPiAKPiBjL3MgZGNmNDE3OTAgIiB4
ODYvbW1jZmcvZHJoZDogTW92ZSBhY3BpX21tY2ZnX2luaXQoKSBjYWxsIGJlZm9yZSBjYWxsaW5n
Cj4gYWNwaV9wYXJzZV9kbWFyKCkiIHJlc3VsdGVkIGluIFBDSSBzZWdtZW50IDAgbm93IGhhdmlu
ZyBiZWVuIGluaXRpYWxpc2VkCj4gZW5vdWdoIGZvciBhY3BpX3BhcnNlX29uZV9kcmhkKCkgdG8g
bm90IHRha2UgdGhlCj4gCj4gICAvKiBTa2lwIGNoZWNraW5nIGlmIHNlZ21lbnQgaXMgbm90IGFj
Y2Vzc2libGUgeWV0LiAqLwo+IAo+IHBhdGggdW5jb25kaXRpb25hbGx5LiAgSG93ZXZlciwgc29t
ZSBzeXN0ZW1zIGhhdmUgRE1BUiB0YWJsZXMgd2hpY2ggbGlzdAo+IGRldmljZXMgd2hpY2ggYXJl
IGRpc2FibGVkIGJ5IHVzZXIgY2hvaWNlIChpbiBwYXJ0aWN1bGFyLCBEZWxsIFBvd2VyRWRnZSBS
NzQwCj4gd2l0aCBJL08gQVQgRE1BIGRpc2FibGVkKSwgYW5kIHR1cm5pbmcgb2ZmIGFsbCBJT01N
VSBmdW5jdGlvbmFsaXR5IGluIHRoaXMKPiBjYXNlIGlzIGVudGlyZWx5IHVuaGVscGZ1bCBiZWhh
dmlvdXIuCj4gCj4gTGVhdmUgdGhlIHdhcm5pbmcgd2hpY2ggaWRlbnRpZmllcyB0aGUgcHJvYmxl
bWF0aWMgZGV2aWNlcywgYnV0IGRyb3AgdGhlCj4gcmVtYWluaW5nIGxvZ2ljLiAgVGhpcyBsZWF2
ZXMgdGhlIHN5c3RlbSBpbiBiZXR0ZXIgb3ZlcmFsbCBzdGF0ZSwgYW5kIHdvcmtpbmcKPiBpbiB0
aGUgc2FtZSB3YXkgdGhhdCBpdCBkaWQgaW4gcHJldmlvdXMgcmVsZWFzZXMuCj4gCj4gUmVwb3J0
ZWQtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZp
ZXdlZC1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+CgpJZ29y
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
