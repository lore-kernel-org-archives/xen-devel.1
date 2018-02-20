From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/5] x86/pv: Avoid leaking other guests'
 MSR_TSC_AUX values into PV context
Date: Tue, 20 Feb 2018 15:26:20 +0000
Message-ID: <3c9f5649-6a2b-a3c0-6441-c1fc4d127b06@citrix.com>
References: <1519127923-23539-1-git-send-email-andrew.cooper3@citrix.com>
 <1519127923-23539-3-git-send-email-andrew.cooper3@citrix.com>
 <20180220152244.2pv64jva6jsmodph@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180220152244.2pv64jva6jsmodph@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <JBeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDIvMTggMTU6MjIsIFdlaSBMaXUgd3JvdGU6Cj4gT24gVHVlLCBGZWIgMjAsIDIwMTgg
YXQgMTE6NTg6NDBBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gSWYgdGhlIENQVSBw
aXBlbGluZSBzdXBwb3J0cyBSRFRTQ1Agb3IgUkRQSUQsIGEgZ3Vlc3QgY2FuIG9ic2VydmUgdGhl
IHZhbHVlIGluCj4+IE1TUl9UU0NfQVVYLCBpcnJlc3BlY3RpdmUgb2Ygd2hldGhlciB0aGUgcmVs
ZXZhbnQgQ1BVSUQgZmVhdHVyZXMgYXJlCj4+IGFkdmVydGlzZWQvaGlkZGVuLgo+Pgo+IFRoaXMg
c2V0dXAgd29ya3Mgb25seSBiZWNhdXNlIENSNC5UU0Q9MD8KCkhhdmluZyBDUjQuVFNEIGNsZWFy
IGlzIHRoZSBkZWZhdWx0LCBhbmQgbWVhbnMgUkRUU0NQIHdpbGwgd29yayBhdCBhbnkKcHJpdmls
ZWdlIGxldmVsLsKgIFNldHRpbmcgQ1I0LlRTRCAoZWl0aGVyIGR1ZSB0byB2aXJ0dWFsaXNlZCBU
U0MsIG9yCmJlY2F1c2UgdGhlIGd1ZXN0IGtlcm5lbCB3YW50cyB0byB0cmFwIHVzZXIgYWNjZXNz
ZXMpIHdpbGwgY2F1c2UgUkRUU0NQCnRvIHRyYXAgaW50byBlbXVsLXByaXYtb3AuCgpUaGVyZSBp
cyBubyB3YXkgb2YgY2F1c2luZyBSRFBJRCB0byB0cmFwIChvbiBoYXJkd2FyZSB3aGljaCBzdXBw
b3J0cyB0aGUKaW5zdHJ1Y3Rpb24pLCBhbmQgaXQgd2lsbCByZWFkIHJlYWQgdGhlIGN1cnJlbnQg
dmFsdWUgb2YgTVNSX1RTQ19BVVguCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
