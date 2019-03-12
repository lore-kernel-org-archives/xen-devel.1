From: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH v4.9 1/1] jiffies: use jiffies64_to_nsecs()
 to fix 100% steal usage for xen vcpu hotplug
Date: Wed, 13 Mar 2019 07:44:04 +0800
Message-ID: <5f7ef4ad-1569-df2c-3811-a55299c8c85b__34705.4287836485$1552434110$gmane$org@oracle.com>
References: <1551772744-524-1-git-send-email-dongli.zhang@oracle.com>
 <15c804c0-eeb1-2adb-9cbf-4a28d39983a0@oracle.com>
 <20190312125600.GF23540@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=U3Eb=RP=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1h3r0t-0003Xl-ML
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 23:40:51 +0000
In-Reply-To: <20190312125600.GF23540@kroah.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: jgross@suse.com, herbert.van.den.bergh@oracle.com, sstabellini@kernel.org, sboyd@kernel.org, frederic@kernel.org, joe.jin@oracle.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, john.stultz@linaro.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

CgpPbiAzLzEyLzE5IDg6NTYgUE0sIEdyZWcgS0ggd3JvdGU6Cj4gT24gV2VkLCBNYXIgMDYsIDIw
MTkgYXQgMDM6MzU6NDBQTSArMDgwMCwgRG9uZ2xpIFpoYW5nIHdyb3RlOgo+PiBUaGFua3MgdG8g
Sm9lIEppbidzIHJlbWluZGluZywgdGhpcyBwYXRjaCBpcyBhcHBsaWNhYmxlIHRvIG1haW5saW5l
IGxpbnV4Cj4+IGtlcm5lbCwgYWx0aG91Z2ggdGhlcmUgaXMgbm8gaXNzdWUgZHVlIHRvIHRoaXMg
a2luZCBvZiBidWcgaW4gbWFpbmxpbmUga2VybmVsLgo+Pgo+PiBUaGVyZWZvcmUsIGNhbiBJIGZp
cnN0IHN1Ym1pdCB0aGlzIHBhdGNoIHRvIG1haW5saW5lIGtlcm5lbCBhbmQgdGhlbiBiYWNrcG9y
dCBpdAo+PiB0byBzdGFibGUgbGludXggd2l0aCBtb3JlIGRldGFpbGVkIGV4cGxhbmF0aW9uIGhv
dyB0aGUgaXNzdWUgaXMgcmVwcm9kdWNlZCBvbiB4ZW4/Cj4gCj4gWWVzLCBwbGVhc2UgZG8gdGhh
dC4KCkkgYW0gd29ya2luZyBvbiBhIHBhdGNoIHRvIHJlZm9ybSB0aGUgeGVuIHN0ZWFsIGNsb2Nr
IGZvcm11bGEgYnkgeGVuIHNwZWNpZmljCmludGVyZmFjZXMgaW4gbGludXgga2VybmVsLiBJbiB0
aGF0IHdheSwgd2Ugd2lsbCBub3QgbmVlZCB0byBjaGFuZ2UgdGhlCnNpZ25hdHVyZSBvZiBleGlz
dGluZyBqaWZmaWVzIHJlbGV2YW50IGZ1bmN0aW9ucyB3aGljaCBleHBlY3Qgb25seSBkZWx0YSB2
YWx1ZXMKYXMgaW5wdXQuCgpUaGUgbmV3IGZvcm11bGEgd2lsbCBub3QgZ2VuZXJhdGUgc3VjaCBs
YXJnZSBpbnB1dCB2YWx1ZS4KCkRvbmdsaSBaaGFuZwoKPiAKPiB0aGFua3MsCj4gCj4gZ3JlZyBr
LWgKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
PiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
