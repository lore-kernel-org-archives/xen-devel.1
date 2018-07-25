From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/pv: Deprecate support for paging out the LDT
Date: Wed, 25 Jul 2018 13:08:48 +0100
Message-ID: <077b406a-9dbb-08bf-fa6f-fff48779c671@citrix.com>
References: <1530012957-26257-1-git-send-email-andrew.cooper3@citrix.com>
 <5B34E42E02000078001CEDD1@prv1-mh.provo.novell.com>
 <32df0a4b-cdda-363b-fb07-ea40872c8e38@citrix.com>
 <5B35C32502000078001350B8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3705878349858472419=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B35C32502000078001350B8@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, wei.liu2@citrix.com, George Dunlap <george.dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

--===============3705878349858472419==
Content-Type: multipart/alternative;
	boundary="------------35CB32D4CFCBC5649CC9D28C"
Content-Language: en-GB

--------------35CB32D4CFCBC5649CC9D28C
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 29/06/18 06:27, Jan Beulich wrote:
>>>> Andrew Cooper <andrew.cooper3@citrix.com> 06/28/18 6:10 PM >>>
>> On 28/06/18 14:35, Jan Beulich wrote:
>>>>>> On 26.06.18 at 13:35, <andrew.cooper3@citrix.com> wrote:
>>>> --- a/xen/arch/x86/Kconfig
>>>> +++ b/xen/arch/x86/Kconfig
>>>> @@ -161,3 +161,24 @@ endmenu
>>>>  source "common/Kconfig"
>>>>  
>>>>  source "drivers/Kconfig"
>>>> +
>>>> +menu "Deprecated Functionality"
>>>> +
>>>> +config LEGACY_PV_LDT_PAGING
>>>> +	def_bool n
>>>> +	prompt "PV LDT Paging-out support"
>>>> +	---help---
>>>> +	  For a very long time, the PV ABI has included the ability to page
>>>> +	  out the LDT by transitioning its mapping to not-present.  This
>>>> +	  functionality is believed to only exist for the PV Windows XP port
>>>> +	  which never came to anything.
>>>> +
>>>> +	  The implementation contains a vCPU scalability limitation in a
>>>> +	  position which is prohibitively complicated to resolve.  As the
>>>> +	  feature is believed to be unused in practice, removing the feature
>>>> +	  is the easiest remediation.
>>>> +
>>>> +	  If you discover a usecase which is broken by this option being off,
>>>> +	  please contact xen-devel@lists.xenproject.org urgently.  Baring
>>>> +	  something unexpected, the code and this option will be removed.
>>> I think it should be said here explicitly when (or to be precise, no earlier
>>> than when) this is going to happen.
>> I'm open to suggests, but decided not to name a specific release (if
>> only to avoid second-guessing our future numbering and release schedule).
>>
>>> I also think the security support status with the option enabled needs to
>>> be clarified. Perhaps we'd go in stages: Introduce the (default off) option,
>>> then (e.g. for 4.13) switch its use to security unsupported, and finally
>>> drop the code (e.g. for 4.14).
>> I presume you mean that we should hide it behind EXPERT at that point?
> That's the best way to express it I guess, yes. Plus some form of remark in
> SUPPORT.md.
>
>
>> What does the middle step gets us.  If its going to be off by default
>> and unable to be enabled by default, that is as good as deleted.
> Think of people only using released code: They'd notice the removed
> functionality only in 4.12. Removing the code right away for 4.13 could
> therefore be too early.

How can we unblock this patch?  I stand by my original point of "that's
as good as deleted and isn't actually useful for distros".

CC'ing the rest.

~Andrew

--------------35CB32D4CFCBC5649CC9D28C
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 29/06/18 06:27, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5B35C32502000078001350B8@prv1-mh.provo.novell.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="">Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a> 06/28/18 6:10 PM &gt;&gt;&gt;
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="">On 28/06/18 14:35, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre wrap="">On 26.06.18 at 13:35, <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a> wrote:
</pre>
              </blockquote>
            </blockquote>
            <pre wrap="">--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -161,3 +161,24 @@ endmenu
 source "common/Kconfig"
 
 source "drivers/Kconfig"
+
+menu "Deprecated Functionality"
+
+config LEGACY_PV_LDT_PAGING
+	def_bool n
+	prompt "PV LDT Paging-out support"
+	---help---
+	  For a very long time, the PV ABI has included the ability to page
+	  out the LDT by transitioning its mapping to not-present.  This
+	  functionality is believed to only exist for the PV Windows XP port
+	  which never came to anything.
+
+	  The implementation contains a vCPU scalability limitation in a
+	  position which is prohibitively complicated to resolve.  As the
+	  feature is believed to be unused in practice, removing the feature
+	  is the easiest remediation.
+
+	  If you discover a usecase which is broken by this option being off,
+	  please contact <a class="moz-txt-link-abbreviated" href="mailto:xen-devel@lists.xenproject.org">xen-devel@lists.xenproject.org</a> urgently.  Baring
+	  something unexpected, the code and this option will be removed.
</pre>
          </blockquote>
          <pre wrap="">I think it should be said here explicitly when (or to be precise, no earlier
than when) this is going to happen.
</pre>
        </blockquote>
        <pre wrap="">I'm open to suggests, but decided not to name a specific release (if
only to avoid second-guessing our future numbering and release schedule).

</pre>
        <blockquote type="cite">
          <pre wrap="">I also think the security support status with the option enabled needs to
be clarified. Perhaps we'd go in stages: Introduce the (default off) option,
then (e.g. for 4.13) switch its use to security unsupported, and finally
drop the code (e.g. for 4.14).
</pre>
        </blockquote>
        <pre wrap="">I presume you mean that we should hide it behind EXPERT at that point?
</pre>
      </blockquote>
      <pre wrap="">That's the best way to express it I guess, yes. Plus some form of remark in
SUPPORT.md.


</pre>
      <blockquote type="cite">
        <pre wrap="">What does the middle step gets us.  If its going to be off by default
and unable to be enabled by default, that is as good as deleted.
</pre>
      </blockquote>
      <pre wrap="">Think of people only using released code: They'd notice the removed
functionality only in 4.12. Removing the code right away for 4.13 could
therefore be too early.</pre>
    </blockquote>
    <br>
    How can we unblock this patch?  I stand by my original point of
    "that's as good as deleted and isn't actually useful for distros".<br>
    <br>
    CC'ing the rest.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------35CB32D4CFCBC5649CC9D28C--


--===============3705878349858472419==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3705878349858472419==--
